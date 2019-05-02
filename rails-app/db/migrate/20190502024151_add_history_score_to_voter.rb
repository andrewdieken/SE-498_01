class AddHistoryScoreToVoter < ActiveRecord::Migration[5.2]
  def change
    add_column :voters, :history_score, :integer, :default => 0
  end
end
