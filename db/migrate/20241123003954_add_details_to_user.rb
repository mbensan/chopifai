class AddDetailsToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string, null: false, limit: 100
    add_column :users, :role, :string, null: false, limit: 100, default: 'user'
    add_column :users, :address, :string
  end
end
