require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new 
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.find {|art| art.name == title}
  end

  def self.find_or_create_by_name(title) 
  result = self.find_by_name(title) 
  if result == nil
      self.create_by_name(title)
    else 
      result 
    end   
  end

  def self.alphabetical
    self.all.sort_by{|word| word.name}
  end

  def self.new_from_filename(filename)
    filename = filename.split(/ [-] |[.]/)
    artist_name = filename[0]
    song_name = filename[1]
    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    filename = filename.split(/ [-] |[.]/)
    artist_name = filename[0]
    song_name = filename[1]
    new_song = self.create_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.destroy_all
    @@all = []
  end
end