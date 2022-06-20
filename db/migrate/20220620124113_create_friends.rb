class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :bank_account_number
      t.string :ifsc_code
      t.integer :swift_number
      t.string :index
      t.string :new
      t.string :show

      t.timestamps
    end
  end
end
