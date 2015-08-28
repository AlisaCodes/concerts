require('spec_helper')

describe(Band) do
  describe('#venues') do
    it { should have_and_belong_to_many(:venues) }
  end

  describe('#create') do
    it('capitalizes text') do
      new_band = Band.create({:name => "arcade fire"})
      expect(new_band.name).to(eq("ARCADE FIRE"))
      expect(Band.find(new_band.id()).name).to(eq("ARCADE FIRE"))
    end

    it('does not save a band already saved in the database') do
      new_band = Band.create({:name => "arcade fire"})
      new_band2 = Band.create({:name => "arcade fire"})
      new_band3 = Band.create({:name => "radiohead"})
      expect(Band.all()).to(eq([new_band, new_band3]))
    end
  end
end
