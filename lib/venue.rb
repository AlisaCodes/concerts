class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  before_validation(:upcase_location)
  validates(:location, {:presence => true})
  validates(:location, {:uniqueness => true})


  private

  define_method(:upcase_location) do
  self.location=(location().upcase())
  end
end
