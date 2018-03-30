# == Schema Information
#
# Table name: clients
#
#  id         :string(255)      not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Client < ActiveRecord::Base
  # making id column act as primary key
  self.primary_key = :id
  before_create :set_id
  has_many :tokens

  def set_id
    unless id.present?
      self.id = SecureRandom.hex(4) + '-' + SecureRandom.hex(2) + '-' + SecureRandom.hex(2)
    end
  end

end
