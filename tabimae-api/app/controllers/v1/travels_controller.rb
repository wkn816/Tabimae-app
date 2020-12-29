class V1::TravelsController < ApplicationController
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
      params.require(:travel).permit(:name, :user_id)
    end
end
