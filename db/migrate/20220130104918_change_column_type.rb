class ChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :moods, :depressed, :integer
    change_column :moods, :anxiety, :integer
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
