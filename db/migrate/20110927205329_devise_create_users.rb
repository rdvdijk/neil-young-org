class DeviseCreateUsers < ActiveRecord::Migration

  def change
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.rememberable
      t.trackable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :time
      t.token_authenticatable

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :authentication_token, :unique => true
  end

end
