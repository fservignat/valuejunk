class AddTitleAddressToJunk < ActiveRecord::Migration[7.0]
  def change
    add_column :junks, :title, :string
    add_column :junks, :address, :string
    add_column :services, :title, :string
    add_column :services, :address, :string
    remove_column :users, :craft
    remove_column :users, :specialty
    rename_column :users, :name, :username
  end
end
