class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.date :date_of_birth
      t.integer :mobile
      t.string :role
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
