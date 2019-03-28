class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
  	change_column :voters, :lVoterUniqueID, :string
  	change_column :voters, :sAffNumber, :string
	change_column :voters, :szStateVoterID, :string
	change_column :voters, :sSitusZip, :string
	change_column :voters, :sHouseNum, :string
	change_column :voters, :sUnitNum, :string
	change_column :voters, :szMailZip, :string
	change_column :voters, :sStatusCode, :string
	change_column :voters, :sUserCode1, :string
	change_column :voters, :szStateVoterID, :string
	change_column :voters, :sUserCode2, :string
  end
end
