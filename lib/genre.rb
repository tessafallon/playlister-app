class Genre
  attr_accessor :name, :songs

  extend Memorable::ClassMethods
  extend Findable
  extend Listable

  include Memorable::InstanceMethods

  def self.action(index)
    self.all[index-1].list_songs
  end

  def list_songs
    # this should be pulled out of both artist and genre into listable
    self.songs.all.each_with_index do |s, index|
      puts "#{index+1}. #{s.name}"
    end
  end

  def self.reset_genres
    reset_all
  end
  reset_genres

  def initialize
    super
    @songs = []
  end

  def artists
    songs.collect{|s| s.artist}.uniq
  end

end
