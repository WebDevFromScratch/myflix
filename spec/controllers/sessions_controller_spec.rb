require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the new template for unauthenticated users" do
      get :new
      expect(response).to render_template(:new)
    end

    it "redirects to home page for authenticated users" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      get :new
      expect(response).to redirect_to(home_path)
    end
  end

  describe "POST create" do
    context "with valid credentials" do
      let(:john) { Fabricate(:user) } #lazy evaluation

      before do
        post :create, email: john.email, password: john.password
      end

      it "sets the session[:user_id] to user id" do
        expect(session[:user_id]).to eq(john.id)
      end

      it "sets the flash message" do
        expect(flash[:success]).not_to be_blank
      end

      it "redirects to home page" do
        expect(response).to redirect_to(home_path)
      end
    end

    context "with invalid credentials" do
      before do
        john = Fabricate(:user)
        post :create, email: john.email, password: john.password + "random_string"
      end

      it "doesn't put the signed in user in the session" do
        expect(session[:user_id]).to be_nil
      end

      it "sets the flash message" do
        expect(flash[:danger]).not_to be_blank
      end

      it "redirects to sign in page" do
        expect(response).to redirect_to(sign_in_path)
      end
    end
  end

  describe "DELETE destroy" do
    before do
      session[:user_id] = Fabricate(:user).id
      delete :destroy
    end

    it "clears the session" do
      expect(session[:user_id]).to be_nil
    end

    it "sets the flash message" do
      expect(flash[:success]).not_to be_blank
    end

    it "redirects to root page" do
      expect(response).to redirect_to(root_path)
    end
  end
end