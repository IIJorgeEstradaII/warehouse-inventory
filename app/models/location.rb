class Location < ApplicationRecord
  has_many :item_locations, dependent: :destroy
  has_many :locations, through: :item_locations
  #Validar que una ubicacion exista

end
