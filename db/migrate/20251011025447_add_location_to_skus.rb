class AddLocationToSkus < ActiveRecord::Migration[8.0]
  def change
    add_reference :skus, :location, null: false, foreign_key: true
  end
end
