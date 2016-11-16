class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :rating
      t.text :body
      t.integer :user_profile_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
