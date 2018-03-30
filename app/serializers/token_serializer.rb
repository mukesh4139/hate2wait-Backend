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

class TokenSerializer < ActiveModel::Serializer
  attributes :serial_number, :token_type, :created_at
end
