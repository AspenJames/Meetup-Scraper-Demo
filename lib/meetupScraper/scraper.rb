require 'nokogiri'
require 'open-uri'
require 'pry'

class MeetupScraper::Scraper 

  def scrape(url)
    doc = Nokogiri::HTML(open(url))
    # `doc` is a representation of the entire page 
    # Let's find a way to pull what we want from 
    # that page, and use that information to create 
    # instances of our MeetupScraper::Group class
  end
end