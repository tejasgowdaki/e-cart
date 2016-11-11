class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :description
      t.integer :stock
      t.date :availability_date
      t.integer :category_id
      t.integer :sub_category_id
      t.integer :brand_id

      t.timestamps null: false
    end
  end
end
