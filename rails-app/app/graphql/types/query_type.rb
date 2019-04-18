module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    description "The query root of this schema"

    #=============================
    # Returns all voters with specified fields
    # Ex) query { allVoters { field1, field2,...,fieldn } }
    #     => { "data": { "allVoters": [ {field1: value}, {field2: value},..., {fieldn: value} ] } }
    #=============================
    field :all_voters, [VoterType], null: false
    def all_voters
      Voter.all
    end

    #=============================
    # Returns a voter by id with specified fields
    # Ex) query { voteById(id: <ID>) { field1, field2,..., fieldn } }
    #     => { "data": { "voterById": { field1: value, field2: value,..., fieldn: value } } }
    #=============================
    field :voter_by_id, [VoterType], null: true do
      description "Find Voter by ID"
      argument :id, ID, required: true
    end
    def voter_by_id(id:)
      Voter.find(id)
    end

    #=============================
    # Returns a voter by sPrecinctID with specified fields
    # Ex) query { voterByPrecinct(id: <ID>) { field1, field2,...,fieldn } }
    #     => { "data": { "voterByPrecinct": [ {field1: value}, {field2: value},..., {fieldn: value} ] } }
    #=============================
    field :voter_by_precinct, [VoterType], null: true do
      description "Find Voter by sPrecinctID"
    end
    def voter_by_precinct()
      Voter.left_outer_joins(:visits).where( visits:{ voter_id:nil }).where(sPrecinctID: Setting.precinct_id)
    end

    field :get_canvasser_password, String, null: false do
      description "Retreive canvasser password"
    end
    def get_canvasser_password()
      Setting['canvasser_password']
    end

    field :get_note_by_id, String, null: true do
      description "Retrieve note for voter"
      argument :id, ID, required: true
    end
    def get_note_by_id(id:)
      voter_note = Voter.find(id).note
      if voter_note.nil?
        Setting['note']
      else
        voter_note
      end
    end

  end
end
