class CampersController < ApplicationController
  before_action :set_camper, only: [:show, :update, :destroy]

  # GET /campers
  def index
    @campers = Camper.all

    render json: @campers
  end

 
  def show
    render json: @camper.detail
  end

  # POST /campers
  def create
    begin
      @camper = Camper.create!(camper_params)
      render json: @camper
    rescue => exception
      render json: {error: exception} , status: :bad_request
    end
  
  end

  

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camper
      begin
        @camper = Camper.find(params[:id])
      rescue => exception
        render json: {error:'Camper not found'} , status: :not_found
      end
     
    end

    # Only allow a list of trusted parameters through.
    def camper_params
      params.require(:camper).permit(:name, :age)
    end
end
