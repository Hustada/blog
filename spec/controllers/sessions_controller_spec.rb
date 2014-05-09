require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end


    it "renders the new template" do
      get 'new'
      expect(response).to render_template('new')
    end
  end

  describe "POST 'create'" do

    context "with correct credentials" do
      let! (:user) { user = User.create(first_name: "Mark", last_name: "Hustad", email: "mark@example.com", password: "12345", password_confirmation: "12345") }
   
    it "redirects to the root path" do
      post :create, email: "mark@example.com", password: "12345"
      expect(response).to be_redirect
      expect(response).to redirect_to(root_path)
    end

    it "finds the user" do
      expect(User).to receive(:find_by).with ({ email: "mark@example.com"}).and_return(user)
      post :create, email: "mark@example.com", password: "12345"
    end

    it "authenticates the user" do
      User.stub(:find_by).and_return(user)
      expect(user).to receive(:authenticate)
      post :create, email: "mark@example.com", password: "12345"
    end
  end
    
  end

end
