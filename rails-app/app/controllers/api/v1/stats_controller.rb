module API
  module V1
    class StatsController < ApplicationController
      def update_houses
        @new_houses = params[:houses_canvassed]
        Setting.houses_canvassed = @new_houses
      end

      def update_volunteers
        @new_volunteers
        Setting.volunteers = Setting['volunteers'] + @new_volunteers
      end
    end
  end
end
