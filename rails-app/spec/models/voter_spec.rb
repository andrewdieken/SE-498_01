require 'rails_helper'

RSpec.describe Voter, type: :model do
  it { should have_many :visits }
end
