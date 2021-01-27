class V1::TravelitemsController < ApplicationController

def index
  @travelitems = Travelitem.all
  render json: @travelitems
end

def create
  @travelitem = Travelitem.new(travelitem_params)
  if travelitem.save
    render json: @travelitem
  else
    render json: @travelitem.errors, status: :unprocessable_entity
  end
end

private

    def travelitem_params
      params.require(:travelitem).permit(:name, :travel_id, :user_id)
    end

end
