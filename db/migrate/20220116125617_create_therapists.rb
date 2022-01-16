class CreateTherapists < ActiveRecord::Migration[6.1]
  def change
    create_table :therapists do |t|
      t.string :firstName
      t.string :lastName
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :location
      t.string :gender
      t.string :specialization
      t.string :imageurl

      t.timestamps
    end
  end
end
