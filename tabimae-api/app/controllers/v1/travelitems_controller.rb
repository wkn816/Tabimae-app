class V1::TravelitemsController < ApplicationController

def index
  @travelitems = Travelitem.all
  render json: @travelitems
end

def create
  items = params[:travelitems]
  if items.present?
    items.each do |item|
      Travelitem.create!(name: item, travel_id: params[:travel])
    end
  end
  render status: 201
end

private

    def travelitem_params
      params.require(:travelitem).permit(:name, :travel_id, :user_id)
    end

end
