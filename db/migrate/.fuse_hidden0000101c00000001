class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_number
      t.date :order_date
      t.float :total
      t.string :order_status
      t.string :payment_mode
      t.integer :user_profile_id
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
