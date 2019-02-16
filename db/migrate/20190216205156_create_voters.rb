class CreateVoters < ActiveRecord::Migration[5.2]
  def change
    create_table :voters do |t|
      t.integer :voterID
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :phone
      t.string :date_of_birth
      t.string :party_affiliation

      t.timestamps
    end
  end
end
