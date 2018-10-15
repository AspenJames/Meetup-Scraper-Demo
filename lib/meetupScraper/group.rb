class MeetupScraper::Group 
  attr_accessor :name, :href
  @@all = []

  def initialize(name, href)
    @name = name
    @href = href
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset! 
    @@all = []
  end
end