module Api
  module V1
    class VotersController < ApplicationController
      def index
        users = Voter.order('created_at DESC');
        render json: {status:'SUCCESS', message:'Loaded Voters', data:users},status: :ok
      end

      def show
        user = Voter.find_by_id(params[:id]);
        if not user.nil?
          render json: {status:'SUCCESS', message:'Loaded Voters', data:user},status: :ok
        else
          render json: {status:'FAILED', message:'Voter Does Not Exist'},status: :unprocessable_entity
        end

      end

    end
  end
end
