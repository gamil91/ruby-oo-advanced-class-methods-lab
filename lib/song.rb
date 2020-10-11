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
    self.all << self.new
    self.all.last
    
  end

  def self.new_by_name(name)
      song = self.new
      song.name = name
      song
  end

  def self.create_by_name(name)
      song = self.create
      song.name = name
      song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name) 
    else
      self.find_by_name(name)
    end
  end

    def self.alphabetical
      self.all.sort_by {|song| song.name }
    end

    def self.new_from_filename(file)
      arr = file.split(" - ")
      name = arr[1].delete_suffix(".mp3")
      artist = arr[0]

      song = self.new
      song.name = name
      song.artist_name = artist
      song
    end

    def self.create_from_filename(file)
     self.all << self.new_from_filename(file)
    end

    def self.destroy_all
      self.all.clear
    end



end
