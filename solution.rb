# Please copy/paste all three classes into this file to submit your solution!
########################################################
# Movie Class
########################################################
class Movie
  attr_accessor :title

  ALL = []

  def initialize(title)
    self.title = title
    self.class.all << self
  end
  ########################################################
  def self.all
    ALL
  end

  def self.find_by_title( title )
    self.all.find { |movie| movie.title == title }
  end
  ########################################################
  def ratings
    Ratings.all.select { |rating| rating.movie == self }
  end

  def viewers
    self.ratings.map { |rating| rating.viewer }
  end

  def average_rating
    scores = self.ratings.map { |rating| rating.score }
    scores.reduce(:+).to_f / scores.length
  end
end
########################################################
# Rating Class
########################################################
class Rating
  attr_accessor :score
  attr_reader :viewer, :movie

  ALL = []

  def initialize( viewer:, movie:, score: )
    @viewer = viewer
    @movie = movie
    self.class.all << self
  end
  ########################################################
  def self.all
    ALL
  end
end
########################################################
# Viewer Class
########################################################
class Viewer
  attr_accessor :first_name, :last_name

  ALL = []

  def initialize(name)
    @name = name
    self.class.all << self
  end
  ########################################################
  def self.all
    ALL
  end

  def self.find_by_name( full_name: )
    self.all.find { |viewer| viewer.full_name == full_name }
  end
  ########################################################
  def full_name
    "#{first_name} #{last_name}"
  end

  def create_rating( movie: , score: )
    Rating.new( viewer: self, movie: movie, score: score )
  end
end
