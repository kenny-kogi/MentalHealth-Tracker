class AddTherapistToPatients < ActiveRecord::Migration[6.1]
  def change
    add_reference :patients, :therapist
  end
end
