class RemoveRecoverableFromAdmins < ActiveRecord::Migration[5.2]
  def up
    remove_column :admins, :reset_password_token
    remove_column :admins, :reset_password_sent_at
  end

  def down
    add_column :admins, :reset_password_token, :string
    add_column :admins, :reset_password_sent_at, :datetime
  end
end
