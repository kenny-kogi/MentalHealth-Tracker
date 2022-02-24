class AddReferenceMoods < ActiveRecord::Migration[6.1]
  def change
    add_reference :moods, :patient,index: true
  end
end
