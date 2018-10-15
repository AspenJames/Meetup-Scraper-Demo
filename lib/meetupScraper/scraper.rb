require 'nokogiri'
require 'open-uri'
require 'pry'

class MeetupScraper::Scraper 

  def scrape(url)
    doc = Nokogiri::HTML(open(url))
    doc.css('ul.j-groupCard-list li a.display-none').slice(0,10).each do |element|
      name = element.children[0].text
      href = element.attributes["href"].value
      MeetupScraper::Group.new(name, href)
    end
  end
end