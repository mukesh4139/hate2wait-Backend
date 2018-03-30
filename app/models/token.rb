# == Schema Information
#
# Table name: tokens
#
#  id            :integer          not null, primary key
#  token_type    :integer
#  token_index   :integer
#  message       :text
#  client_id     :string(255)
#  serial_number :string(255)
#  served        :boolean          default(FALSE)
#  created_at    :datetime
#  updated_at    :datetime
#

class Token < ActiveRecord::Base
  belongs_to :client
  enum token_type: [:premium, :standard, :free]
  before_create :assign_token

  validates :token_type, :presence => {message: "Token type is required"}
  validates :client_id, :presence => {message: "Client Id is required"}

  def assign_token
    self.token_index = next_token_index
    self.serial_number = next_serial_number
  end

  private

  def self.base_token token_type
    {premium: 1, standard: 4, free: 9}[token_type.to_sym]
  end

  def next_token_index
    last_token =  Token.where(token_type: Token.token_types[token_type], served: false).order('token_index DESC').first
    if last_token.present?
      Token.next_index(token_type, last_token.token_index)
    else
      Token.base_token token_type
    end
  end

  def self.next_index type, index
    if type == "premium"
      index % 10 == 3 ? index + 8 : index + 1
    elsif type == "standard"
      index % 10 == 8 ? index + 6 : index + 1
    elsif type == "free"
      index % 10 == 0 ? index + 9 : index + 1
    end
  end

  def next_serial_number
    tokenize (self.token_index % 999)
  end

  def tokenize token_index
    'A' + token_index.to_s.rjust(3, '0')
  end
end
