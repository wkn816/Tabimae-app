class V1::TravelsController < ApplicationController
  def create
    travel = Travel.new(travel_params)
    if travel.save
      render json: travel, status: :created
    else
      render json: travel.errors, status: :unprocessable_entity
    end
  end


  private

    def travel_params
      params.require(:travel).permit(:transport, :name, :user_id)
    end
end
