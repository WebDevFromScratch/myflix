class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.video = Video.find(params[:video_id])
    @review.user = current_user

    if @review.save
      flash[:success] = "Your review has been created!"
      redirect_to video_path(@review.video)
    else
      #remember to add errors
      render "videos/show"
    end
  end

  private

  def review_params
    params.require(:review).permit!
  end
end