class QueueItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :video

  def rating
    review = self.video.reviews.where(user_id = user.id).last
    if !review
      ""
    elsif review.rating == 1
      "1 Star"
    else
      "#{review.rating} Stars"
    end
  end

  def category_name
    self.video.category.name
  end

  def video_title
    self.video.title
  end
end
