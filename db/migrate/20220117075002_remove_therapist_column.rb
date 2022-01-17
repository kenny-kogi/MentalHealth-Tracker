class RemoveTherapistColumn < ActiveRecord::Migration[6.1]
  def change
     remove_column :patients, :therapist_id
  end
end
