class VideosController < ApplicationController
  def index
    @videos = Video.all #would I even need this?
    @categories = Category.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def search
    @videos = Video.search_by_title(params[:search_field])
  end
end