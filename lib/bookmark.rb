class Bookmark

    @@list = [
      'www.google.com',
      'www.makersacademy.com',
      'www.mylittlepony.com'
    ]

  def self.all
    @@list
  end

  def add
    @@list << self
  end


end
