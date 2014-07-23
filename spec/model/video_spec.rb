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

  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
