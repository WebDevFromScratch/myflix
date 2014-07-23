require 'spec_helper'

describe Video do
  it 'saves itself' do
    video = Video.new(title: "House", small_cover_url: "/tmp/house_sm.jpg", 
      large_cover_url: "/tmp/house_lg.jpg", description: "An antisocial 
      maverick doctor who specializes in diagnostic medicine does whatever it 
      takes to solve puzzling cases that come his way using his crack team of 
      doctors and his wits.")
    video.save

    Video.first.should == video
    # expect(Video.first).to eq(video) - different syntax used (based on solution vid)
    # - this is the style favored by rspec dev team, so from now on I'll be using this
  end

  it { should belong_to(:category) } #seems like I jumped ahead finding 'shoulda'

  it 'fails validation when no title' do
    no_title = Video.new(title: "", description: "Example description")
    house = Video.new(title: "House", description: "House solves puzzles")

    expect(no_title).to have(1).errors_on(:title)
    expect(house).to have(0).errors_on(:title)
  end

  it 'fails validation when no description' do
    no_description = Video.new(title: "Example title", description: "")
    house = Video.new(title: "House", description: "House solves puzzles")
    
    expect(no_description).to have(1).errors_on(:description)
    expect(house).to have(0).errors_on(:description)
  end
end
