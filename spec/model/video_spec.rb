require 'spec_helper'

describe Video do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  describe "search_by_title" do
    it "returns an array of one video where search_term is an exact match" do
      vid1 = Video.create(title: "Name1", description: "Description1")
      vid2 = Video.create(title: "Name2", description: "Description2")
      vid3 = Video.create(title: "Some Other", description: "Description3")

      expect(Video.search_by_title("Name1")).to eq([vid1])
    end

    it "returns an array of one Video where search_term is a partial match" do
      vid1 = Video.create(title: "Name1", description: "Description1")
      vid2 = Video.create(title: "Name2", description: "Description2")
      vid3 = Video.create(title: "Some Other", description: "Description3")

      expect(Video.search_by_title("me2")).to eq([vid2])
    end

    it "returns an array of multiple Videos where search_term is a partial match (in an order based on created_at)" do
      vid1 = Video.create(title: "Name1", description: "Description1")
      vid2 = Video.create(title: "Name2", description: "Description2")
      vid3 = Video.create(title: "Some Other", description: "Description3")

      expect(Video.search_by_title("Name")).to eq([vid2, vid1])
    end

    it "returns an empty array if search_term is not a part of any Video.title" do
      vid1 = Video.create(title: "Name1", description: "Description1")
      vid2 = Video.create(title: "Name2", description: "Description2")
      vid3 = Video.create(title: "Some Other", description: "Description3")

      expect(Video.search_by_title("Woof")).to eq([])
    end

    it "returns an empty array if search_term is an empty string" do
      vid1 = Video.create(title: "Name1", description: "Description1")
      vid2 = Video.create(title: "Name2", description: "Description2")
      vid3 = Video.create(title: "Some Other Name", description: "Description3")

      expect(Video.search_by_title("")).to eq([])
    end
  end
end
