class Track < ActiveRecord::Base
    attr_accessible :name, :title, :tpath, :track_number, :year, :bpm, :length, :size, :user_id, :artists_attributes, :album_attributes
    attr_accessible :genre_attributes, :album_id, :genre_id, :genre, :album, :album_artist, :artists, :index

    mount_uploader :tpath, TpathUploader

    belongs_to :user
    # belongs_to :playlist
    # belongs_to :artist
    # belongs_to :library
    belongs_to :album
    belongs_to :genre

    has_many :libraries, :through => :track_libraries
    has_many :track_libraries
    has_many :playlists, :through => :playlist_tracks
    has_many :playlist_tracks
    has_many :artists, :through => :artist_tracks
    has_many :artist_tracks
    has_many :loans


    letsrate_rateable "sound"


    accepts_nested_attributes_for :artists
    accepts_nested_attributes_for :album
    accepts_nested_attributes_for :genre



    def parse_id3(data)
      x = "public"+tpath.to_s
      # binding.pry
      Mp3Info.open(x) do |f|
      # binding.pry
      self.title = f.tag2["TIT2"]
      self.bpm = f.tag2["TBPM"]
      # self.name = f.tag2["TPE1"]
      self.year = f.tag2["TYER"]
      self.track_number = f.tag2["TRCK"]
      self.length = f.length.to_i
      self.size = x.size * 1024
      # self.name = data[:name].split("/")
      # binding.pry
      self.album = Album.find_or_create_by_name(f.tag2["TALB"])
      self.album.artist = Artist.find_or_create_by_name(f.tag2["TPE2"])
      self.genre = Genre.find_or_create_by_name(f.tag2["TCON"])
      # binding.pry
      # self.album_artist = Artist.find_or_create_by_name(f.tag2["TPE2"])

      f.tag2["TPE1"].split("/").each do |i|
        a = []
        a[0] = Artist.find_or_create_by_name(i)
        # binding.pry
        self.artists << a
        # binding.pry
      end
      # binding.pry

      # # Attached picture frame
      # cover = tag.frame_list('APIC').first
      # cover.mime_type
      # cover.picture
      # self.parse_artist(data)
      # binding.pry
    end
  end


end
