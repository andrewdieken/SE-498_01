class Voter < ApplicationRecord
  before_save :set_random_voter_score
  has_many :visits

  def set_random_voter_score
    if self.history_score == 0
      self.history_score = rand(1..10)
    end
  end

  def self.save_all
    Voter.all.each { |voter| voter.save! }
  end
end
