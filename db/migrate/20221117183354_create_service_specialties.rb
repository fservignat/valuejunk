class CreateServiceSpecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :service_specialties do |t|
      t.references :specialty, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
