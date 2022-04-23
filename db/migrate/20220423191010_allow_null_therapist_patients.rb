class AllowNullTherapistPatients < ActiveRecord::Migration[6.1]
  def change

    change_column :patients, :therapists_id, :bigint, null: true, foreign_key: true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
