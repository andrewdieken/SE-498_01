module Types
<<<<<<< HEAD
<<<<<<< HEAD
  class Types::MutationType < Types::BaseObject
=======
  class MutationType < Types::BaseObject
>>>>>>> Enable react app to make calls to Graphql server
    field :create_voter, mutation: Mutations::CreateVoter
=======
  class Types::MutationType < Types::BaseObject
    field :create_voter, mutation: Mutations::CreateVoter, camelize: true
>>>>>>> Add all voter arguments to create voter mustation
  end
end
