class AddCoordinatesToJunks < ActiveRecord::Migration[7.0]
  def change
    add_column :junks, :latitude, :float
    add_column :junks, :longitude, :float
  end
end
