class RemoveReference < ActiveRecord::Migration[6.1]
  def change
    remove_reference :patients, :therapists, index: true, foreign_key: true
  end
end
