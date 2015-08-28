require('spec_helper')

describe(Venue) do
  describe('#bands') do
    it { should have_and_belong_to_many(:bands) }
  end

  describe('#create') do
    it('capitalizes text') do
      new_venue = Venue.create({:location => "the forum"})
      expect(new_venue.location).to(eq("THE FORUM"))
      expect(Venue.find(new_venue.id()).location).to(eq("THE FORUM"))
    end

    it('does not save a venue already saved in the database') do
      new_venue = Venue.create({:location => "THE FORUM"})
      new_venue2 = Venue.create({:location => "THE FORUM"})
      new_venue3 = Venue.create({:location => "GREEK THEATER"})
      expect(Venue.all()).to(eq([new_venue, new_venue3]))
    end
  end
end
