class CreateMoods < ActiveRecord::Migration[6.1]
  def change
    create_table :moods do |t|
      t.integer :hours_slept
      t.string :depressed
      t.string :anxiety
      t.integer :irritability_level
      t.integer :elevated_level
      t.boolean :psychotic_symptoms
      t.string :weather

      t.timestamps
    end
  end
end
