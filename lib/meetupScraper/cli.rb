require 'launchy'
class MeetupScraper::CLI

  def initialize 
    MeetupScraper::Group.reset!
    @@url = "https://www.meetup.com/find/tech/?allMeetups=false&radius=5&userFreeform=98105&gcResults=Seattle%2C+WA+98105%2C+USA%3AUS%3AWashington%3AKing+County%3ASeattle%3Anull%3A98105%3A47.6614244%3A-122.2683743&change=yes&sort=default"
  end

  def run 
    MeetupScraper::Scraper.new.scrape(@@url)
    self.list_groups
    self.list_menu
  end

  def list_groups 
    puts "Hello! The top ten tech Meetups in Seattle are: "
    #TODO: Iterate over all saved groups, display options
  end

  def list_menu 
    puts "Select a number to open in browser, 'exit!', or 'list' to return to the menu"
    input = nil
    until input == "exit!"
      input = gets.chomp
      if input.to_i.between?(1,10)
        #TODO: We have a valid input, let's do something with it!
        # Hint: require 'launcy' up top should be a good place to start
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