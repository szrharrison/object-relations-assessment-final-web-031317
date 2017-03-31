class Viewer
  extend Netflix
  attr_accessor :first_name, :last_name

  ALL = []

  def initialize( first_name, last_name)
    @first_name = first_name
    @last_name = last_name
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
