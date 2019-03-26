module Mutations
  class CreateVoter < BaseMutation
    argument :szNameLast, String, required: false
    argument :szNameFirst, String, required: false

    def resolve(szNameLast:, szNameFirst:)
      voter = Voter.create(szNameLast: szNameLast, szNameFirs: szNameLast)
    end
  end
end
