class CreateSkus < ActiveRecord::Migration[8.0]
  def change
    create_table :skus do |t|
      t.string :description, null: false
      t.string :part_number, null: false
      t.timestamps
    end
  end
end
