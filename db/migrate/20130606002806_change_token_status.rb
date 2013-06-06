class ChangeTokenStatus < ActiveRecord::Migration
  def up
    remove_column :users, :token
    add_column :users, :session_token, :string
  end

  def down
    add_column :users, :token, :integer
    remove_column :users, :session_token
  end
end
