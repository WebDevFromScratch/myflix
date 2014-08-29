require 'spec_helper'

describe QueueItemsController do
  describe "GET index" do
    it 'sets the @queue_items variable as queue items for the logged in user' do
      current_user = Fabricate(:user)
      session[:user_id] = current_user.id
      queue_item1 = Fabricate(:queue_item, user: current_user)
      queue_item2 = Fabricate(:queue_item, user: current_user)
      get :index

      expect(assigns(:queue_items)).to match_array([queue_item1, queue_item2])
    end

    it 'redirects to sign in page for unauthenticated users' do
      get :index

      expect(response).to redirect_to(sign_in_path)
    end
  end
end