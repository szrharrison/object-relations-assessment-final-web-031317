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
