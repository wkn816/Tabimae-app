class V1::TravelsController < ApplicationController

  def index
    # if params[:id]
    #   @travel = Travel.find_by(id: params[:id])
    #   render json: @travel
    # else

    id = JSON.parse!(params[:user], symbolize_names: true)[:id]
    user = User.find(id)
    # @travels = user.travels.where('departure_day > ?', Date.today)
    @travels = user.travels.select do |travel|
      # binding.pry
      if travel.trains.present?
      travel.trains[0].departure_day > Date.today
      else
      travel.airs[0].departure_day > Date.today
      end
    end
    render json: @travels,include: [:trains, :airs]
    # end
  end

  def sabdelete

  end

  def show
    travel = Travel.find(params[:id])
    render json: travel,include: [:trains, :airs]
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
        render json: travel,include: [:trains, :airs]
    end
  end

  private

    def travel_params
      params.require(:travel).permit(:name, :transport, :user_id)
    end
end
