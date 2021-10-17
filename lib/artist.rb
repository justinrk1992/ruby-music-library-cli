require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    # @songs = []
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def save
    @@all << self
  end

  def to_s
    self.name
  end

end


