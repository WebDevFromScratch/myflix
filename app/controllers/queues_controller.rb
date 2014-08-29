class QueuesController < ApplicationController #wonder if that would need to be changed?
  def index
    user = current_user
    @queue_items = user.queue_items
  end
end