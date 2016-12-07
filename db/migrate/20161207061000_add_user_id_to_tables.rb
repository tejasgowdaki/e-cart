class AddUserIdToTables < ActiveRecord::Migration
  def change

  	add_column :addresses, :user_id, :integer
  	add_column :cart_line_items, :user_id, :integer
  	add_column :order_line_items, :user_id, :integer
  	add_column :orders, :user_id, :integer
  	add_column :reviews, :user_id, :integer

  end
end
