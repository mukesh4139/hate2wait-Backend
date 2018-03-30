require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #index" do
    it "should render :index view" do
      get :index
      response.should render_template :index
    end
  end
end
