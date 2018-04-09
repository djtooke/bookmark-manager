class Bookmark

    @@list = []

  def self.all
    @@list
  end

  def add
    @@list << self
  end


end
