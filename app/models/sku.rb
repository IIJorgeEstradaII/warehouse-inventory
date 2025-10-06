class Sku < ApplicationRecord
  has_many :item_locations
  has_many :skus, through: :item_locations
end
