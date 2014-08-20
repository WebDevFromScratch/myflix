require 'spec_helper'

describe SessionsController do
  describe "POST create" do
    it 'sets the user variable when user exists' do
      my_user = Fabricate(:user, email: 'user@example.com')
      post :create
      expect(assigns(:user)).to eq(my_user)
    end
    it 'sets the session[:user_id] to user id when user exists and authenticates'
    it 'redirects to home page when user exists and authenticates'
    it "redirects to sign in page when user doesn't exist and/or doesn't authenticate"
  end

  describe "DELETE destroy" do
  end
end