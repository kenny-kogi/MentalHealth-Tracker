class AddReferenceFeedback < ActiveRecord::Migration[6.1]
  def change
    add_reference :feedbacks, :patient, foreign_key: true, index: true
    add_reference :feedbacks, :therapist, foreign_key: true, index: true
  end
end
