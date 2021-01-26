class TravelitemSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :travel_id
  belongs_to :travel

end
