class CreateOrderLineItems < ActiveRecord::Migration
  def change
    create_table :order_line_items do |t|
      t.float :price
      t.integer :quantity
      t.integer :order_id
      t.integer :product_id
      t.integer :user_profile_id

      t.timestamps null: false
    end
  end
end
