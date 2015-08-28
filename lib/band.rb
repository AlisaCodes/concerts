class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  before_validation(:upcase_name)
  validates(:name, {:presence => true})
  validates(:name, {:uniqueness => true})


  private

  define_method(:upcase_name) do
  self.name=(name().upcase())
  end
end
