class AddInfosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string
    add_column :users, :zip_code, :string
    add_column :users, :country, :string
    add_column :users, :province, :string
    add_column :users, :city, :string
  end
end
