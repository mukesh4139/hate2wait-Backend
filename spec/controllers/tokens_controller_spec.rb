require 'rails_helper'

RSpec.describe TokensController, type: :controller do
  before(:each) do
    require 'securerandom'
    120.times do |n|
      client_id = SecureRandom.hex(4) + '-' + SecureRandom.hex(2) + '-' + SecureRandom.hex(2)
      token_type = rand(0..2)
      message = Faker::Lorem.sentence
      Token.create(client_id: client_id,
                   token_type: token_type,
                   message: message)
    end
  end

  describe "GET #index" do
    it "returns only 100 items at a time" do
      expected_count = 100
      get :index
      expect(assigns(:tokens).count).to eq(expected_count)
    end

    it "returns only 20 items in second page" do
      expected_count = 20
      get :index, {page: 2}
      expect(assigns(:tokens).count).to eq(expected_count)
    end

    it "returns correct number of premium tokens" do
      expected_count = Token.where(token_type: 0).count
      get :index, {type: "premium"}
      expect(assigns(:tokens).count).to eq(expected_count)
    end

    it "returns correct number of standard tokens" do
      expected_count = Token.where(token_type: 1).count
      get :index, {type: "standard"}
      expect(assigns(:tokens).count).to eq(expected_count)
    end

    it "returns correct number of free tokens" do
      expected_count = Token.where(token_type: 2).count
      get :index, {type: "free"}
      expect(assigns(:tokens).count).to eq(expected_count)
    end

    it "filters message and return correct number of record" do
      message = "Earum"
      expected_count = Token.where("lower(message) LIKE ? ", "%"+message.downcase()+"%").count
      get :index, {message: message}
      expect(assigns(:tokens).count).to eq(expected_count)
    end

    it "returns correct number of standard tokens after applying message filter" do
      message = "Earum"
      expected_count = Token.where(token_type: 1).where("lower(message) LIKE ? ", "%"+message.downcase()+"%").count
      get :index, {message: message, type: "standard"}
      expect(assigns(:tokens).count).to eq(expected_count)
    end

    it "returns no tokens that has been cleared from queue" do
      (1..34).each do |id|
        Token.find(id).update(served: true)
      end
      expected_count = Token.where(served: false).count
      get :index
      expect(assigns(:tokens).count).to eq(expected_count)
    end
  end

  describe "GET #clear_queue" do
    it "should clear the queue" do
      get :clear_queue
      expected_count = Token.where(served: false).count
      expect(expected_count).to eq(0)
    end
  end

  describe "Post #create" do

  end

end
