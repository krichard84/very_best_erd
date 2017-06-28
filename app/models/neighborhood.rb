class Neighborhood < ApplicationRecord
  # Direct associations

  belongs_to :bookmark,
             :foreign_key => "bookmarks_id"

  has_many   :venues,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
