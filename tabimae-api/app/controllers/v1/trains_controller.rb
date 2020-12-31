class V1::TrainsController < ApplicationController
  def create
    train = Train.new(train_params)
    if train.save
      render json: train, status: :created
    else
      render json: train.errors, status: :unprocessable_entity
    end
  end


    private

    def train_params
      params.require(:train).permit(:departure_day, :departure_time, :arrival_time, :departure_place, :arrival_place, :user_id)
    end

end
