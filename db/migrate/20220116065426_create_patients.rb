class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :firstName
      t.string :lastName
      t.string :username
      t.string :password_digest
      t.string :location
      t.integer :age
      t.string :occupation
      t.string :gender
      t.string :image_url
      t.string :mental_health_status
      t.string :mental_health_facility

      t.timestamps
    end
  end
end
