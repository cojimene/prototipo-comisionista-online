class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.text :about
      t.integer :experience
      t.string :city
      t.string :phone

      t.timestamps
    end
  end
end
