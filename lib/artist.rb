require 'pry'

class Artist

  @@all = []

  attr_accessor :name, :songs


  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end


  def self.find_or_create_by_name(name)
    target = @@all.find {|artist_object| artist_object.name == name}

    if target
      return target
    else
      new_artist = Artist.new(name)
      @@all << new_artist
    end
    new_artist
  end

  def add_song(song_instance)
    self.songs << song_instance
  end

  def save
    @@all << self
  end

  def print_songs
    self.songs.each{ | song | puts song.name }
  end
end
