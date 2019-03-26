class AddVisitToVoter < ActiveRecord::Migration[5.2]
  def change
    add_reference :visits, :voter, foreign_key: true, index: true
  end
end
