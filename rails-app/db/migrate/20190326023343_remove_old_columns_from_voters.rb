class RemoveOldColumnsFromVoters < ActiveRecord::Migration[5.2]
  def change
    remove_column :voters, :voterID, :integer
    remove_column :voters, :last_name, :string
    remove_column :voters, :first_name, :string
    remove_column :voters, :middle_name, :string
    remove_column :voters, :address, :string
    remove_column :voters, :city, :string
    remove_column :voters, :state, :string
    remove_column :voters, :zip, :string
    remove_column :voters, :email, :string
    remove_column :voters, :phone, :string
    remove_column :voters, :date_of_birth, :string
    remove_column :voters, :party_affiliation, :string
  end
end
