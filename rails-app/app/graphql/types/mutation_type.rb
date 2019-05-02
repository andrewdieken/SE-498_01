module Types
  class MutationType < Types::BaseObject
    field :create_voter, mutation: Mutations::CreateVoter
    field :update_houses, mutation: Mutations::UpdateHouses
    field :update_volunteers, mutation: Mutations::UpdateVolunteers
  end
end
