require 'spec_helper'

describe VideosController do
  describe 'GET show' do

    #we can get rid of contexts and make it a more flatter structure
    #we'd need to pass authenticated/unauthenticated factor in the cases description
    #(see how it's done with search action)

    context "with authenticated users" do
      before do
        session[:user_id] = Fabricate(:user).id
      end

      it 'assigns the requested video to @video' do
        video = Fabricate(:video)
        get :show, id: video.id
        expect(assigns(:video)).to eq(video)
      end
    end

    context "with unauthenticated users" do
      it 'redirects to sign in page' do
        video = Fabricate(:video)
        get :show, id: video.id
        expect(response).to redirect_to(sign_in_path)
      end
    end
  end

  describe 'GET search' do
    it 'sets @videos for authenticated users' do
      session[:user_id] = Fabricate(:user).id
      futurama = Fabricate(:video, title: 'Futurama')
      suits = Fabricate(:video, title: 'Suits')
      #we actually don't need to test for various cases here, since we do this in unit test

      get :search, search_field: "its"
      expect(assigns(:results)).to eq([suits])
    end

    it 'redirects to sing in page for unauthenticated users' do
      get :search
      expect(response).to redirect_to(sign_in_path)
    end
  end
end