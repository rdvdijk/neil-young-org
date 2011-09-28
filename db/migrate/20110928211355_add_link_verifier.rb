class AddLinkVerifier < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.references :verifier
    end
  end
end
