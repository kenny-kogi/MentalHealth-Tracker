class ChangeMoodUserIdToNullable < ActiveRecord::Migration[6.1]
  def change
    change_column :moods, :user_id, :bigint, null: :true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
