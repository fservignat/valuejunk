class CreateJunks < ActiveRecord::Migration[7.0]
  def change
    create_table :junks do |t|
      t.text :description
      t.string :category
      t.integer :price
      t.boolean :donation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
