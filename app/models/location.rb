class Location < ApplicationRecord
  has_many :item_locations
  has_many :locations, through: :item_locations

end
