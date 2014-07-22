class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :desription
      t.string :small_cover_url
      t.string :large_cover_url

      t.timestamps
    end
  end
end
