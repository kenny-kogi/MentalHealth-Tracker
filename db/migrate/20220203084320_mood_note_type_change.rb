class MoodNoteTypeChange < ActiveRecord::Migration[6.1]
  def change
    change_column :moods, :mood_note, :text
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
