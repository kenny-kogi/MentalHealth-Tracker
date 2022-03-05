class CreateMedications < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|
      t.string :drug_name
      t.text :prescription
      t.integer :usage_interval

      t.timestamps
    end
  end
end
