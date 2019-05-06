module Api
  module V1
    class StatsController < ApplicationController
      def update_houses
        @houses = params[:houses].to_i
        if Setting.houses_canvassed = Setting['houses_canvassed'] + @houses
          render json: {status: 'SUCCESS'}, status: :ok
        else
          render json: {status: 'ERROR'}, status: :unprocessable_entity
        end
      end

      def update_volunteers
        @volunteers = params[:volunteers].to_i
        if Setting.volunteers = Setting['volunteers'] + @volunteers
          render json: {status: 'SUCCESS'}, status: :ok
        else
          render json: {status: 'ERROR'}, status: :unprocessable_entity
        end
      end
    end
  end
end
