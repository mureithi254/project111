class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.text :phone_number
      t.string :password_digest

      t.timestamps
    end
  end
end
