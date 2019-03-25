module Types
  class MutationType < Types::BaseObject
    field :create_voter, mutation: Mutations::CreateVoter
  end
end
