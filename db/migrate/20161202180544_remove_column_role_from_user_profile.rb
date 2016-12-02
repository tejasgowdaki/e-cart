class RemoveColumnRoleFromUserProfile < ActiveRecord::Migration
  def change
  	remove_column :user_profiles, :role
  end
end
