class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :location
      t.integer :age
      t.string :occupation
      t.string :gender
      t.string :image_url

      t.timestamps
    end
  end
end
