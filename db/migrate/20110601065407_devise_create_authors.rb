class DeviseCreateAuthors < ActiveRecord::Migration
  def self.up
    change_table(:authors) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      t.encryptable
      t.confirmable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.token_authenticatable


    end

    add_index :authors, :email,                :unique => true
    add_index :authors, :reset_password_token, :unique => true
    # add_index :authors, :confirmation_token,   :unique => true
    # add_index :authors, :unlock_token,         :unique => true
    # add_index :authors, :authentication_token, :unique => true
  end

  def self.down
    remove_column :authors, :email
    remove_index :authors, :reset_password_token
    remove_column :authors, :database_authenticatable
    remove_column :authors, :recoverable
    remove_column :authors, :rememberable
    remove_column :authors, :trackable
    remove_column :authors, :encryptable
    remove_column :authors, :confirmable
    remove_column :authors, :lockable
    remove_column :authors, :token_authenticatable
  end
end
