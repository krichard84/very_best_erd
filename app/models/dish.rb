class Dish < ApplicationRecord
  # Direct associations

  belongs_to :cuisine,
             :foreign_key => "cuisines_id"

  # Indirect associations

  # Validations

end
