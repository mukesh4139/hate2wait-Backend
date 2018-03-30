# == Schema Information
#
# Table name: clients
#
#  id         :string(255)      not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Client, type: :model do
  before(:each) do
    @client = Client.create!(id: "05f9ba50-716d-1f7e")
  end

  describe "creation" do
    it "should have one item created after being created" do
      expect(Client.count).to eq(1)
    end
  end
end
