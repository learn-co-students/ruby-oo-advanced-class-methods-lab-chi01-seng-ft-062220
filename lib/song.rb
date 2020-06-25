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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    @@all << song
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end

  def self.new_from_filename(info)
    song = self.new
    array = info.split(' - ')
    song.artist_name = array[0]
    song.name = array[1].chomp(".mp3")
    song
  end

  def self.create_from_filename (filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
