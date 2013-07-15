class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.integer :age
      t.date :birthday
      t.string :first_name
      t.string :last_name
      t.integer :image_id
      t.string :name
      t.string :gender
      t.integer :alias_id
      t.string :artist_type

      t.timestamps
    end
  end
end
