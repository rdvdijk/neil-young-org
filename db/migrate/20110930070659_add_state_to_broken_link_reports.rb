class AddStateToBrokenLinkReports < ActiveRecord::Migration
  def change
    change_table :broken_link_reports do |t|
      t.string :state, :null => false
    end
  end
end
