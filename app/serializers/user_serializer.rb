class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :username, :email,:location, :age, :occupation, :gender, :image

  include Rails.application.routes.url_helpers

  def image  
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end

end
