class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :title
      t.text :address
      t.string :landmark
      t.integer :user_profile_id

      t.timestamps null: false
    end
  end
end
