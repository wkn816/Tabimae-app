class V1::TravelsController < ApplicationController

  def index
    travel = Travel.all(travel_params)
    render json: travel, status: index
  end

  def create
    travel = Travel.new(travel_params)
    if travel.save
      render json: travel, status: :created
    else
      render json: travel.errors, status: :unprocessable_entity
    end
  end


  def destroy
    travel = Travel.find(params[:id])
    if travel.destroy
        render json: travel
    end
  end

  private

    def travel_params
      params.require(:travel).permit(:name, :transport, :user_id)
    end
end
