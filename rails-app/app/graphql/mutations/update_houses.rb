module Mutations
  class UpdateHouses < BaseMutation
    # arguments passed to the 'resloved' method
    argument :number_of_houses, Integer, required: true

    field :success, Boolean, null: false

    def resolve(number_of_houses:)
      if Setting.houses_canvassed = Setting['houses_canvassed'] + number_of_houses
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
