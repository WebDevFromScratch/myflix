class Category < ActiveRecord::Base
  has_many :videos, -> { order("created_at DESC") } #this is just added for default order
  #has_many :videos, order: "created_at DESC" #this doesn't work in Rails 4+

  def recent_videos
    videos.first(6)
  end
end