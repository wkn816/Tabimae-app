class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  def username
    object.user.name
  end
end
