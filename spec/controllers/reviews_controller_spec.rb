require 'spec_helper'

describe ReviewsController do
  describe "POST create" do
    context "user authorized, with valid input" do
      before do
        session[:user_id] = Fabricate(:user).id
        video = Fabricate(:video)
        post :create, video_id: 1, review: Fabricate.attributes_for(:review)
      end

      it "creates the review" do
        expect(Review.count).to eq(1)
      end

      it "sets a user for the review" do
        expect(Review.first.user.id).to eq(session[:user_id])
      end

      it "sets a video for the review" do
        expect(Review.first.video.id).to eq(1) #do I need this?
      end

      it "redirects to review's video page" do
        expect(response).to redirect_to(video_path(Review.first.video))
      end
    end

    context "user authorized, with invalid input" do
      before do
        session[:user_id] = Fabricate(:user).id
        video = Fabricate(:video)
        post :create, video_id: 1, review: Fabricate.attributes_for(:review, text: "")
      end

      it "doesn't create the review" do
        expect(Review.count).to eq(0)
      end

      #it "shows errors" #will I need to check this? should be taken care of by bootstrap_form_for

      it "renders the video show template" do
        expect(response).to render_template "videos/show"
      end
    end

    context "user not authorized" do
      before do
        session[:user_id] = nil
        video = Fabricate(:video)
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