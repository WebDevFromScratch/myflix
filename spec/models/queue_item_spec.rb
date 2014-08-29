require 'spec_helper'

describe QueueItem do
  it { should belong_to(:user) }
  it { should belong_to(:video) }

  describe "#rating" do
    it "sets the rating variable as the oldest rating from the user" do
      user = Fabricate(:user)
      video = Fabricate(:video)
      review1 = Fabricate(:review, rating: 3, user_id: user.id, video_id: video.id)
      review2 = Fabricate(:review, rating: 1, user_id: user.id, video_id: video.id, created_at: 1.day.ago)
      queue_item = Fabricate(:queue_item, user_id: user.id, video_id: video.id)

      expect(queue_item.rating).to eq("1 Star")
    end

    it "returns an empty string if the user didn't rate a video" do
      user = Fabricate(:user)
      video = Fabricate(:video)
      queue_item = Fabricate(:queue_item, user_id: user.id, video_id: video.id)

      expect(queue_item.rating).to be_blank
    end

    it "returns a user rating with a string Star if user rated video as 1" do
      user = Fabricate(:user)
      video = Fabricate(:video)
      review = Fabricate(:review, rating: 1, user_id: user.id, video_id: video.id)
      queue_item = Fabricate(:queue_item, user_id: user.id, video_id: video.id)

      expect(queue_item.rating).to eq("1 Star")
    end

    it "returns a user rating with a string Stars if user rated video higher than 1" do
      user = Fabricate(:user)
      video = Fabricate(:video)
      review = Fabricate(:review, rating: 2, user_id: user.id, video_id: video.id)
      queue_item = Fabricate(:queue_item, user_id: user.id, video_id: video.id)

      expect(queue_item.rating).to eq("2 Stars")
    end
  end

  describe "#category_name" do
    it "returns the associated video category name" do
      category = Fabricate(:category)
      video = Fabricate(:video, category: category)
      queue_item = Fabricate(:queue_item, video: video)

      expect(queue_item.category_name).to eq(category.name)
    end
  end

  describe "#video_title" do
    it "returns the associated video title" do
      video = Fabricate(:video)
      queue_item = Fabricate(:queue_item, video: video)

      expect(queue_item.video_title).to eq(video.title)
    end
  end
end