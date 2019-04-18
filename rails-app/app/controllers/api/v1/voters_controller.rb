module Api
  module V1
    class VotersController < ApplicationController
      def index
        voters = Voter.page(params[:page]).per(2)
        total_pages = voters.total_pages
        previous_page = voters.prev_page
        next_page = voters.next_page
        render json: {meta: {total_pages: total_pages, previous_page: previous_page, next_page: next_page},status:'SUCCESS', message:'Loaded Voters', data:voters},status: :ok
      end

      def show
        voter = Voter.find_by_id(params[:id])
        if not voter.nil?
          render json: {status:'SUCCESS', message:'Loaded Voters', data:voter},status: :ok
        else
          render json: {status:'FAILED', message:'Voter Does Not Exist'},status: :unprocessable_entity
        end
      end

      def update
        voter = Voter.find_by_id(params[:id])
        voter.note = params[:note]
        if voter.save
          render json: {status: 'SUCCESS', id: params[:id]},status: :ok
        else
          render json: {status: 'FAILED', id: params[:id]}, status: :unprocessable_entity
        end
      end

    end
  end
end
