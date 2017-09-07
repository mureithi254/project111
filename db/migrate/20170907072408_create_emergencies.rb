class CreateEmergencies < ActiveRecord::Migration[5.1]
  def change
    create_table :emergencies do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :description
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
