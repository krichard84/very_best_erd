class Cuisine < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :foreign_key => "cuisines_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
