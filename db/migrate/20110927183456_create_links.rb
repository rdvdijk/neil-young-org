class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.string :description
      t.string :state
      t.string :poster_name
      t.string :poster_email
      t.string :poster_ip_address

      t.timestamps
    end
  end
end
