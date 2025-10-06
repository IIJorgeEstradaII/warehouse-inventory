class CreateItemLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :item_locations do |t|
      t.belongs_to :sku, index: true, foreign_key: true
      t.belongs_to :location, index: true, foreign_key: true
      t.timestamps
    end
  end
end
