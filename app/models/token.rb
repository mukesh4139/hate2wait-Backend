# == Schema Information
#
# Table name: tokens
#
#  id             :integer          not null, primary key
#  token_type     :integer
#  message        :text
#  client_id      :string(255)
#  response_token :string(255)
#  served         :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Token < ActiveRecord::Base
  belongs_to :client
  enum token_type: [:free, :standard, :premium]
end
