require 'nokogiri'
require 'open-uri'
require 'pry'

class MeetupScraper::Scraper 

  def scrape(url)
    doc = Nokogiri::HTML(open(url))
    binding.pry
  end
end