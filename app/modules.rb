module Netflix

  def all
    ALL
  end

  def find_by_name_or_title( name_title )
    if self == Movie
      self.all.find { |movie| movie.title == name_title }
    elsif self == Viewer
      self.all.find { |viewer| viewer.name == name_title }
    else
      false
    end
  end
end
