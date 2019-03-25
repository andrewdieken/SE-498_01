module Mutations
  class CreateVoter < BaseMutation
    argument :szNameLast, String, required: false
    argument :szNameFirst, String, required: false

    field :voter, Types::VoterType, null: true
    field :errors, [String], null: false

    def resolve(szNameLast:, szNameFirst:)
      voter = Voter.new(szNameLast: szNameLast, szNameFirs: szNameLast)
      if voter.save
        {
          voter: voter,
          errors: []
        }
      else
        {
          voter: nil,
          errors: voter.errors.full_messages
        }
      end
    end
  end
end
