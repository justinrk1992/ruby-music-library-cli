require 'pry'

class Genre
    extend Concerns::Findable
    attr_accessor :name
    @@all = []
  
    def initialize(name)
      @name = name
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
  
    def artists
      self.songs.collect{|s| s.artist}.uniq
    end
  
    def songs
      Song.all.select do |song|
        song.genre == self
      end
    end
  
    def save
      @@all << self
    end
  end

