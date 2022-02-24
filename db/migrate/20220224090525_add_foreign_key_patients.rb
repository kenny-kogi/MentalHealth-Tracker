class AddForeignKeyPatients < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :patients, :therapists
  end
end
