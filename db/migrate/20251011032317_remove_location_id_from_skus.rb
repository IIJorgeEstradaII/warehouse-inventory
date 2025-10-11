class RemoveLocationIdFromSkus < ActiveRecord::Migration[8.0]
  def change
    remove_column :skus, :location_id, :bigint
  end
end
