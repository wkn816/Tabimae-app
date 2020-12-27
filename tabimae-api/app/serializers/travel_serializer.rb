class TravelSerializer < ActiveModel::Serializer
  attributes :id, :transpor, :name, :user_id, :username
  belongs_to :user

  def username
    object.user.name
  end
end
