class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    render json: @activities
  end

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
    def activity_params
      params.require(:activity).permit(:name, :difficulty)
    end
end
