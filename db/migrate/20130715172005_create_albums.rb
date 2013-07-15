class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :image
      t.string :name
      t.text :description
      t.integer :album_artist
      t.integer :artist_id

      t.timestamps
    end
  end
end
