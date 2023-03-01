class SignupsController < ApplicationController
  def create
    camper = Camper.find_by(id: params[:id])
    activity = Activity.find_by(id: params[:id])
    if camper && activity
    signup = signup.create!(signup_params)
    render json: activity
    rescue ActiveRecord::RecordInvalid
    render json: { errors: ["validation errors"] }, status: :unprocessable_entity
  end

  private
  def signup_params
    params.permit(:time, :camper_id, :activity_id)
  end
end

