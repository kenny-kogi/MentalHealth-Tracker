class AddNullUser < ActiveRecord::Migration[6.1]
  def change
    change_column :moods, :user_id, :bigint, null: true, index: true, foreign_key: true
  end
end
