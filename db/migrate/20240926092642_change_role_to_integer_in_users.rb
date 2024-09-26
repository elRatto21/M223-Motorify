class ChangeRoleToIntegerInUsers < ActiveRecord::Migration[7.2]
  def up
    add_column :users, :role_tmp, :integer, default: 0

    User.reset_column_information
    User.find_each do |user|
      case user.role
      when 'admin'
        user.update_column(:role_tmp, 2)
      when 'teamleader'
        user.update_column(:role_tmp, 1)
      else
        user.update_column(:role_tmp, 0)
      end
    end

    remove_column :users, :role

    rename_column :users, :role_tmp, :role
  end

  def down
    add_column :users, :role_tmp, :string

    User.reset_column_information
    User.find_each do |user|
      case user.role
      when 2
        user.update_column(:role_tmp, 'admin')
      when 1
        user.update_column(:role_tmp, 'teamleader')
      else
        user.update_column(:role_tmp, 'member')
      end
    end

    remove_column :users, :role

    rename_column :users, :role_tmp, :role
  end
end
