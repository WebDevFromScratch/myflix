require 'spec_helper'

describe UsersController do
  describe 'GET new' do
    it 'sets the @user variable' do
      get :new
      #(assigns(:user)).to be_a_new(User) #can I use that instead?
      expect(assigns(:user)).to be_new_record
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe 'POST create' do
    context "with valid attributes" do
      before { post :create, user: Fabricate.attributes_for(:user) }

      it "creates the user record in the database" do
        expect(User.count).to eq(1)
      end

      it "redirects to sign in page" do
        expect(response).to redirect_to(sign_in_path)
      end
    end

    context "with invalid attributes" do
      before { post :create, user: Fabricate.attributes_for(:user, email: "") }

      it "doesn't save the user record in the database" do
        expect(User.count).to eq(0)
      end

      it "renders the new template" do
        expect(response).to render_template(:new)
      end

      it "sets the @user variable" do
        expect(assigns(:user)).to be_instance_of(User)
      end
    end
  end
end