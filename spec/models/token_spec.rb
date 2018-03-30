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

require 'rails_helper'

RSpec.describe Token, type: :model do
  it {should respond_to :id}
  it {should respond_to :client_id}
  it {should respond_to :token_type}
  it {should respond_to :token_index}
  it {should respond_to :message}
  it {should respond_to :serial_number}
  it {should respond_to :served}

  it "has a valid factory" do
    expect(FactoryGirl.create(:token)).to be_valid
  end
end
