class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :cover_image_url

      t.timestamps
    end
  end
end
