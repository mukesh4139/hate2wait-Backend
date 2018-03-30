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
  before(:each) do
    @token = Token.create!(client_id: "05f9ba50-716d-1f7e", token_type: Token.token_types[:premium], message: "I want a premium token")
  end

  describe "creation" do
    it "should have one item created after being created" do
      expect(Token.count).to eq(1)
    end
  end

  describe "validations" do
    it "should not allow to create token without token type" do
      @token.token_type = nil
      expect(@token).not_to be_valid
    end

    it "should not allow to create token without client id" do
      @token.client_id = nil
      expect(@token).not_to be_valid
    end

    it "should return serial_number A001 for first premium client" do
      expect(@token.serial_number).to eq('A001')
    end

    it "should return serial_number A004 for first standard client" do
      token = Token.create!(client_id: "05f9ba50-716d-1f7e", token_type: Token.token_types[:standard], message: "I want a standard token")
      expect(token.serial_number).to eq('A004')
    end

    it "should return serial_number A009 for first free client" do
      token = Token.create!(client_id: "05f9ba50-716d-1f7e", token_type: Token.token_types[:free], message: "I want a standard token")
      expect(token.serial_number).to eq('A009')
    end
  end
end
