module Api
  module V1
    class VisitsController < ApplicationController
      def create
        if params.has_key?(:id)
          visit = Visit.new({voter_id: params[:id]})
          if visit.save
            render json: {status: 'SUCCESS', id: params[:id]},status: :ok
          else
            render json: {status: 'FAILED', id: params[:id]}, status: :unprocessable_entity
          end
        end
      end

    end
  end
end
