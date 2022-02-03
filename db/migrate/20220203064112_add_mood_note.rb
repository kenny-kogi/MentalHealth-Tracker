class AddMoodNote < ActiveRecord::Migration[6.1]
  def change
    add_column :moods, :mood_note, :string
    add_column :moods, :activity, :string
  end
end
