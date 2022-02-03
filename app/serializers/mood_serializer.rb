class MoodSerializer < ActiveModel::Serializer
  attributes :id, :hours_slept, :depressed, :anxiety, :irritability_level, :elevated_level, :psychotic_symptoms, :weather, :mood_note, :activity


  belongs_to :user
end


