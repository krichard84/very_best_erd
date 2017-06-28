class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :dishes,
             :class_name => "Dish"

  belongs_to :cuisine

  # Indirect associations

  # Validations

end
