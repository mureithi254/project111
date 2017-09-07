class CreateHospitals < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
