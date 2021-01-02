class V1::AirsController < ApplicationController
  def create
    air = Air.new(air_params)
    if air.save
      render json: air, status: :created
    else
      render json: air.errors, status: :unprocessable_entity
    end
  end


    private

    def air_params
      params.require(:air).permit(:departure_day, :departure_time, :arrival_time, :departure_place, :arrival_place, :user_id)
    end
end
