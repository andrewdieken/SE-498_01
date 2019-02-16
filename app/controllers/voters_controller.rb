class VotersController < ApplicationController
  before_action :set_voter, only: [:show, :edit, :update, :destroy]

  # GET /voters
  def index
    @voters = Voter.all
  end

  # GET /voters/1
  def show
  end

  # GET /voters/new
  def new
    @voter = Voter.new
  end

  # GET /voters/1/edit
  def edit
  end

  # POST /voters
  def create
    @voter = Voter.new(voter_params)

    if @voter.save
      redirect_to @voter, notice: 'Voter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /voters/1
  def update
    if @voter.update(voter_params)
      redirect_to @voter, notice: 'Voter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /voters/1
  def destroy
    @voter.destroy
    redirect_to voters_url, notice: 'Voter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voter
      @voter = Voter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def voter_params
      params.require(:voter).permit(:voterID, :last_name, :first_name, :middle_name, :address, :city, :state, :zip, :email, :phone, :date_of_birth, :party_affiliation)
    end
end
