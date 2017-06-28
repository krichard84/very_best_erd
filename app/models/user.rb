class User < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :dependent => :destroy

  # Indirect associations

  has_many   :bookmarks,
             :through => :dishes,
             :source => :bookmarks

  # Validations

end
