require 'spec_helper'

describe Category do
  it { should have_many(:videos) }

  describe "#recent_videos" do
    it "returns videos in reverse order" do
      category = Category.create(name: "Category")
      video1 = Video.create(title: "title1", description: "description1", 
                category: category)
      video2 = Video.create(title: "title2", description: "description2", 
                category: category, created_at: 1.day.ago)

      expect(category.recent_videos).to eq([video1, video2])
    end

    it "returns all the videos if there are less than 6 videos" do
      category = Category.create(name: "Category")
      video1 = Video.create(title: "title1", description: "description1", 
                category: category)
      video2 = Video.create(title: "title2", description: "description2", 
                category: category)

      expect(category.recent_videos.count).to eq(2)
    end

    it "returns 6 videos if there are more than (or equal to) six videos" do
      category = Category.create(name: "Category")
      6.times { Video.create(title: "title", description: "description", 
                    category: category) }
      video7 = Video.create(title: "title7", description: "description7", 
                category: category, created_at: 1.day.ago)

      expect(category.recent_videos).not_to include(video7)
    end

    it "returns an empty array if there are no videos" do
      category = Category.create(name: "Category")

      expect(category.recent_videos).to eq([])
    end
  end
end