class SignupsController < ApplicationController
  

  

  # POST /signups
  def create
    begin
      @signup = Signup.create!(signup_params)
      render json: @signup.activity
    rescue => exception
      render json: {errors: exception}
    end
  

    
  end

  

  private
 

    # Only allow a list of trusted parameters through.
    def signup_params
      params.require(:signup).permit(:camper_id, :activity_id, :time)
    end
end
