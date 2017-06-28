class Dish < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :bookmarks,
             :foreign_key => "dishes_id",
             :dependent => :destroy

  belongs_to :cuisine,
             :foreign_key => "cuisines_id"

  # Indirect associations

  # Validations

end
