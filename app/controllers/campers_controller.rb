class CampersController < ApplicationController

  def index
    campers = Camper.all
    render json: campers.as_json(only: [:id, :name, :age]), status: :ok
  end

  def show
    camper = Camper.find_by(id: params[:id])
    render json: camper
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Camper not found" }, status: :not_found
  end

  def create
    camper = camper.create!(camper_params)
    render json: camper, status: :created
  rescue ActiveRecord::RecordInvalid
    render json: { errors: ["validation errors"] }, status: :unprocessable_entity
  end

  private

  def camper_params
    params.permit(:name, :age)
  end

end
