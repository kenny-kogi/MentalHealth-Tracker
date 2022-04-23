class AddColumnMoodNoteActivity < ActiveRecord::Migration[6.1]
  def change
    add_column :moods, :activity, :string
    add_column :moods, :mood_note, :text
  end
end
