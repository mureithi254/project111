class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :fname
      t.string :lname
      t.text :phone
      t.string :email
      t.string :status
      t.text :insurance

      t.timestamps
    end
  end
end
