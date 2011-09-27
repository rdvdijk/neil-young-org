class AddLinkBelongsToCategory < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.references :category
    end
  end
end
