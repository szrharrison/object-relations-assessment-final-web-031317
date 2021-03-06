class Movie
  extend Netflix
  attr_accessor :title

  ALL = []

  def initialize(title)
    self.title = title
    self.class.all << self
  end
  ########################################################
  def ratings
    Rating.all.select { |rating| rating.movie == self }
  end

  def viewers
    self.ratings.map { |rating| rating.viewer }
  end

  def average_rating
    scores = self.ratings.map { |rating| rating.score }
    scores.reduce(:+).to_f / scores.length
  end
end
