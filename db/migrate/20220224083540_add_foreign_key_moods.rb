class AddForeignKeyMoods < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :moods, :patients
  end
end
