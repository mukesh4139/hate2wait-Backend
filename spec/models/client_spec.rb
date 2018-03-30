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
  it {should respond_to :id}
  it "has a valid factory" do
    expect(FactoryGirl.create(:client)).to be_valid
  end
end
