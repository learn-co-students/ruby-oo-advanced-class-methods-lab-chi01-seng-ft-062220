require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end
  
  def name
    @name
  end

  def artist_name
    @artist_name
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song_title = filename.split(/ - |\./, 3)
    song.artist_name = song_title[0]
    song.name = song_title[1]
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

song = Song.create_by_name("Blank Space")
song = Song.create_by_name("Mercy")
song = Song.create_by_name("Hello")
song = Song.create_by_name("Lover")
song = Song.create_by_name("Night Moves")
song = Song.create_by_name("What's Your Pleasure?")

# binding.pry