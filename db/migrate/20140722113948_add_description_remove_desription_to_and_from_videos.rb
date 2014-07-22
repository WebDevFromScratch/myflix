class AddDescriptionRemoveDesriptionToAndFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :desription, :string
    add_column :videos, :description, :string
  end
end
