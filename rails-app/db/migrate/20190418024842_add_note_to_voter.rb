class AddNoteToVoter < ActiveRecord::Migration[5.2]
  def change
    add_column :voters, :note, :string
  end
end
