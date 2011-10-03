class AddCreatorToLink < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.references :creator
    end
  end
end
