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
