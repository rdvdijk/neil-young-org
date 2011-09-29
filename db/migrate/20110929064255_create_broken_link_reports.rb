class CreateBrokenLinkReports < ActiveRecord::Migration
  def change
    create_table :broken_link_reports do |t|
      t.references :link
      t.string :ip_address

      t.timestamps
    end
    add_index :broken_link_reports, :link_id
  end
end
