class TravelSerializer < ActiveModel::Serializer
  attributes :id, :transport, :name, :user_id, :username,:travelitems
  belongs_to :user
  has_many :trains
  has_many :airs


  def username
    object.user.name
  end

  def travelitems
    object.travelitems.pluck(:name)
  end
end
