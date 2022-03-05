class AddReferenceMedication < ActiveRecord::Migration[6.1]
  def change
    add_reference :medications, :patient, foreign_key: true, index: true
  end
end
