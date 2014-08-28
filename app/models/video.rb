class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> {order("created_at DESC")}

  validates_presence_of :title, :description

  def self.search_by_title(search_term)
    return [] if search_term.empty?
    where("title LIKE ?", "%#{search_term}%").order('created_at DESC')
  end

  def average_rating
    if reviews.count == 0
      "0.0"
    else
      "%.1f" % (reviews.map(&:rating).sum.to_f / reviews.count.to_f).to_s
    end
  end
end