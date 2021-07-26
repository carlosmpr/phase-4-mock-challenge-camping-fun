class ActivitiesController < ApplicationController


  # GET /activities
  def index
    @activities = Activity.all

    render json: @activities
  end

  # DELETE /activities/1
  def destroy
    begin
      @activity = Activity.find(params[:id])
      @activity.destroy
      render json: {msg:"Operation completed succesfully"}
    rescue => exception
      render json: {error:"Activity not found"}
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:name, :difficulty)
    end
end
