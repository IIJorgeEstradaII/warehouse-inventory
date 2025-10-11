class AddQtyToSkus < ActiveRecord::Migration[8.0]
  def change
    add_column :skus, :qty, :integer, null: false
    #Add constraint
     add_check_constraint :skus, 'qty > 0', name: 'qty_non_negative_non_zero'
  end
end
