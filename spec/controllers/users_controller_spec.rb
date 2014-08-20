require 'spec_helper'

describe UsersController do
  describe 'GET new' do
    it 'sets the @user variable' do
      #setup
      #action
      get :new
      #verification
      #(assigns(:user)).to be_a_new(User)
      expect(assigns(:user)).to be_new_record
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe 'POST create' do
    it "creates the user record in the database with valid attributes" do
      #user = Fabricate(:user)
      post :create, user: Fabricate.attributes_for(:user)
      expect(User.count).to eq(1)
    end
    #flash message?
    it "redirects to sign in page with valid attributes" do
      post :create, user: Fabricate.attributes_for(:user)
      expect(response).to redirect_to(sign_in_path)
    end
    it "renders the new template with invalid attributes" do
      post :create, user: Fabricate.attributes_for(:user, email: "")
      expect(response).to render_template(:new)
    end
  end
end