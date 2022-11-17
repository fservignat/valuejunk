class AddCraftToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :craft, :string
  end
end
