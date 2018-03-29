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

require 'rails_helper'

RSpec.describe Token, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
