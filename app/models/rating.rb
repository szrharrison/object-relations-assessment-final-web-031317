class Rating
  extend Netflix
  attr_accessor :score
  attr_reader :viewer, :movie

  @@all = []

  def initialize( viewer:, movie:, score: )
    @viewer = viewer
    @movie = movie
    @score = score
    self.class.all << self
  end
end
