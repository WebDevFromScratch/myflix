require 'spec_helper'

describe ReviewsController do
  describe "POST create" do
    let(:video) { Fabricate(:video) }

    context "user authenticated, with valid input" do
      let(:current_user) { Fabricate(:user) }

      before do
        session[:user_id] = current_user.id
        post :create, video_id: video.id, review: Fabricate.attributes_for(:review)
      end

      it "creates the review" do
        expect(Review.count).to eq(1)
      end

      it "creates a review associated with a video" do
        expect(Review.first.user).to eq(current_user)
      end

      it "creates a review associated with an authenticated user" do
        expect(Review.first.video).to eq(video)
      end

      it "redirects to review's video page" do
        expect(response).to redirect_to(video_path(video))
      end
    end

    context "user authenticated, with invalid input" do
      let(:current_user) { Fabricate(:user) }

      before do
        session[:user_id] = Fabricate(:user).id
      end

      it "doesn't create a review" do
        post :create, video_id: video.id, review: Fabricate.attributes_for(:review, text: "")
        expect(Review.count).to eq(0)
      end

      it "renders the videos/show template" do
        post :create, video_id: video.id, review: Fabricate.attributes_for(:review, text: "")
        expect(response).to render_template "videos/show"
      end

      it "sets @video" do
        post :create, video_id: video.id, review: Fabricate.attributes_for(:review, text: "")
        expect(assigns(:video)).to eq(video)
      end

      it "sets @reviews" do
        review = Fabricate(:review, video: video) #this has to be in db before the action, thus creating problems with building a 'before' and 'let' filters
        post :create, video_id: video.id, review: Fabricate.attributes_for(:review, text: "")
        expect(assigns(:reviews)).to match_array([review])
      end
    end

    context "user not authenticated" do
      before do
        session[:user_id] = nil #dunno if I need to set that specifically
        post :create, video_id: 1, review: Fabricate.attributes_for(:review)
      end

      it "doesn't allow to create a review" do
        expect(Review.count).to eq(0)
      end

      it "redirects to sign in page" do
        expect(response).to redirect_to(sign_in_path)
      end
    end
  end
end