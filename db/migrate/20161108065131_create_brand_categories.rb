class CreateBrandCategories < ActiveRecord::Migration
  def change
    create_table :brand_categories do |t|
      t.integer :category_id
      t.integer :brand_id

      t.timestamps null: false
    end
  end
end
