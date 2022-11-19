class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.text :description
      t.integer :price
      t.string :craft
      t.boolean :volunteer
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
