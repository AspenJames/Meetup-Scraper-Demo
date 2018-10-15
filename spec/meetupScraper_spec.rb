RSpec.describe MeetupScraper do
  it "has a version number" do
    expect(MeetupScraper::VERSION).not_to be nil
  end

  describe MeetupScraper::Group do
    it "can be created with a name and href value" do
      @group = MeetupScraper::Group.new("PuPPy", "meetup.com/puppy")
      expect(@group.name).to eq("PuPPy")
      expect(@group.href).to eq("meetup.com/puppy")
    end
  end
end
