class RemoveUserProfileIdFormTables < ActiveRecord::Migration
  def change

  	remove_column :addresses, :user_profile_id
  	remove_column :cart_line_items, :user_profile_id
  	remove_column :order_line_items, :user_profile_id
  	remove_column :orders, :user_profile_id
  	remove_column :reviews, :user_profile_id

  end
end
