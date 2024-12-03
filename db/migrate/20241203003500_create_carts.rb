class CreateCarts < ActiveRecord::Migration[7.2]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :billed, null: false, default: false

      t.timestamps
    end
  end
end
