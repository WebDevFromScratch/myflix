require 'spec_helper'

describe QueuesController do
  it 'sets the @queue_items variable' do
    current_user = Fabricate(:user)
    video1 = Fabricate(:video)
    video2 = Fabricate(:video)
    session[:user_id] = current_user.id
    queue_item1 = Fabricate(:queue_item, user: current_user, video: video1)
    queue_item2 = Fabricate(:queue_item, user: current_user, video: video2)
    get :index

    expect(assigns(:queue_items)).to eq([queue_item1, queue_item2])
  end
end