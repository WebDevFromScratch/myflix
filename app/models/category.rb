class Category < ActiveRecord::Base
  has_many :videos, -> { order("title") } #this is just added for default order
end