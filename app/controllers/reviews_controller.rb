class ReviewsController < ApplicationController
  before_action :require_user

  def create
    @review = Review.new(review_params)
    @video = Video.find(params[:video_id])
    @review.video = @video
    @review.user = current_user

    if @review.save
      flash[:success] = "Your review has been created!"
      redirect_to video_path(@review.video)
    else
      @reviews = @video.reviews.reload #reload loads the data from the db (leaving 'in-memory' objects out)
      render "videos/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :text)
  end
end