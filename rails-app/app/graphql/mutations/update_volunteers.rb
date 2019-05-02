module Mutations
  class UpdateVolunteers < BaseMutation
    # arguments passed to the 'resloved' method
    argument :number_of_volunteers, Integer, required: true

    field :success, Boolean, null: false

    def resolve(number_of_volunteers:)
      if Setting.volunteers = Setting['volunteers'] + number_of_volunteers
        {
          success: true
        }
      else
        {
          success: false
        }
      end
    end
  end
end
