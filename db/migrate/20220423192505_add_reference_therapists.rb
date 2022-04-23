class AddReferenceTherapists < ActiveRecord::Migration[6.1]
  def change
    add_reference :patients, :therapist,index: true
  end
end
