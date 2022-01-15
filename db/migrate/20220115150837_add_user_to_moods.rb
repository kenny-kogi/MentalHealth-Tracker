class AddUserToMoods < ActiveRecord::Migration[6.1]
  def change
    add_reference :moods, :user, null: false, foreign_key: true, index: true
  end
end
