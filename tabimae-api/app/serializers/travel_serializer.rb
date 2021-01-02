class TravelSerializer < ActiveModel::Serializer
  attributes :id, :transport, :name, :user_id, :username
  belongs_to :user
  has_many :trains
  has_many :airs
  def username
    object.user.name
  end
end
