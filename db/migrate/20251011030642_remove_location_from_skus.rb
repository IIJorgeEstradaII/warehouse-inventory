class RemoveLocationFromSkus < ActiveRecord::Migration[8.0]
  def change
    remove_column :skus, :location, :string
  end
end
