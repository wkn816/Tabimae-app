class V1::TravelsController < ApplicationController

  def index
    # if params[:id]
    #   @travel = Travel.find_by(id: params[:id])
    #   render json: @travel
    # else

    id = JSON.parse!(params[:user], symbolize_names: true)[:id]
    # binding.pry
    user = User.find(id)
    @travels = user.travels
    render json: @travels,include: [:trains, :airs]
    # end
  end

  def show
    travel = Travel.find(params[:id])

    render json: travel,include: [:trains, :airs]
  end


    # binding.pry
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
        render json: travel
    end
  end

  private

    def travel_params
      params.require(:travel).permit(:name, :transport, :user_id)
    end
end
