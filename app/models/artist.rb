class Artist < ActiveRecord::Base
  attr_accessible :age, :alias_id, :artist_type, :birthday, :first_name, :gender, :image_id, :last_name, :name

  has_many :tracks, :through => :artist_tracks
  has_many :artist_tracks
  has_many :albums
  has_many :artist_images

end
