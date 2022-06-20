class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :bank_account_number
      t.string :ifsc_code
      t.integer :swift_number

      t.timestamps
    end
  end
end
