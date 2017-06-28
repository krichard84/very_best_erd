class Bookmark < ApplicationRecord
  # Direct associations

  has_one    :neighborhood,
             :foreign_key => "bookmarks_id",
             :dependent => :destroy

  belongs_to :venues,
             :class_name => "Venue"

  belongs_to :dishes,
             :class_name => "Dish"

  belongs_to :cuisine

  # Indirect associations

  # Validations

end
