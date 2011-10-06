class AddAdminBitsToRole < ActiveRecord::Migration
  def change
    change_table :roles do |t|
      t.boolean :admin
      t.boolean :super_admin
    end
  end
end
