class Category < ActiveRecord::Base
  has_many :videos, -> { order("title") } #this is just added for default order

  def self.recent_videos(cat_id)
    Video.where("category_id LIKE ?", "#{cat_id}").order('created_at DESC').first(6)
  end
end