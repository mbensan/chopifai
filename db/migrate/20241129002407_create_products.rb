class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name, limit: 255, null: false
      t.integer :price, null: false
      t.string :sku, limit: 255, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
