require 'launchy'
class MeetupScraper::CLI

  def initialize 
    MeetupScraper::Group.reset!
  end

  def run 
    MeetupScraper::Scraper.new.scrape("https://www.meetup.com/find/tech/?allMeetups=false&radius=5&userFreeform=98105&gcResults=Seattle%2C+WA+98105%2C+USA%3AUS%3AWashington%3AKing+County%3ASeattle%3Anull%3A98105%3A47.6614244%3A-122.2683743&change=yes&sort=default")
    self.list_groups
    self.list_menu
  end

  def list_groups 
    puts "Hello! The top ten tech Meetups in Seattle are: "
    MeetupScraper::Group.all.each_with_index do | group, idx |
      puts "#{idx + 1}. #{group.name}"
    end
  end

  def list_menu 
    puts "Select a number to open in browser, 'exit!', or 'list' to return to the menu"
    input = nil
    until input == "exit!"
      input = gets.chomp
      if input.to_i.between?(1,10)
        Launchy.open(MeetupScraper::Group.all[input.to_i - 1].href)
        self.list_groups
        self.list_menu
      elsif input == 'list'
        self.list_groups
        self.list_menu
      elsif input == 'exit!'
        exit 
      else 
        puts "I didn't quite get that..."
        self.list_menu
      end
    end
  end
end