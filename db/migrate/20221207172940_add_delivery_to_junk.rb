class AddDeliveryToJunk < ActiveRecord::Migration[7.0]
  def change
    add_column :junks, :delivery, :boolean
  end
end
