class ActivitiesController < ApplicationController
  def index
    activities = Activity.all
    render json: activities, status: :ok
  end

  def destroy
    acitivity = Activity.find_by(id: params[:id])
    acitivity.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Activity not found" }, status: :not_found
  end
end
