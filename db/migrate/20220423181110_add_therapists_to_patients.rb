class AddTherapistsToPatients < ActiveRecord::Migration[6.1]
  def change
    add_reference :patients, :therapists, null: false, foreign_key: true
  end
end
