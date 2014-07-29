require 'spec_helper'

describe Category do
  it { should have_many(:videos) }

  describe "recent_videos" do
    it "returns an array of last 6 videos if there are more than 6 videos" do
      cat1 = Category.create(name: "Category1")
      vid1 = Video.create(title: "Name1", description: "Description1", created_at: 1.day.ago)
      vid2 = Video.create(title: "Name2", description: "Description2")
      vid3 = Video.create(title: "Name3", description: "Description3", created_at: 1.month.ago)
      vid4 = Video.create(title: "Name4", description: "Description4")
      vid5 = Video.create(title: "Name5", description: "Description5", created_at: 1.week.ago)
      vid6 = Video.create(title: "Name6", description: "Description6")
      vid7 = Video.create(title: "Name7", description: "Description7")

      cat1.videos << [vid1, vid2, vid3, vid4, vid5, vid6, vid7]

      expect(Category.recent_videos(cat1.id)).to eq([vid7, vid6, vid4, vid2, vid1, vid5])
    end
    it "returns an array of all videos if there are less (or equal to) 6 videos" do
      cat1 = Category.create(name: "Category1")
      vid1 = Video.create(title: "Name1", description: "Description1", created_at: 1.day.ago)
      vid2 = Video.create(title: "Name2", description: "Description2")
      vid3 = Video.create(title: "Name3", description: "Description3", created_at: 1.month.ago)

      cat1.videos << [vid1, vid2, vid3]

      expect(Category.recent_videos(cat1.id)).to eq([vid2, vid1, vid3])
    end
  end
end