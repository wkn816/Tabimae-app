class TrainSerializer < ActiveModel::Serializer
  attributes :id, :departure_day, :departure_time, :arrival_time, :departure_place, :arrival_place, :user_id, :travel_id
  belongs_to :travel

  # def username
  #   object.user.name
  # end
end
