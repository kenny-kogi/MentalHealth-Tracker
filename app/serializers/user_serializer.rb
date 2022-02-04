class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :username, :email, :password, :location, :age, :occupation, :gender, :image, :moods


  has_many :moods

  def image  
    if object.image.attached?
      rails_blob_path(object.image, only_path: true)
    end
  end

    def moods    
      self.object.moods.map do |mood|      
        {mood: mood}    
      end  
    end

end
