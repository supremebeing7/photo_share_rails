class ChangeUsers < ActiveRecord::Migration
  def change
    rename_column :users, :password_reset_toke, :password_reset_token
  end
end
