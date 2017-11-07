class CreeateContactsManyToManyRelation < ActiveRecord::Migration[5.1]
  def change
    create_table :users_contacts, force: true, id: false do |t|
      t.integer :user_id, null: false
      t.integer :contact_id, null: false
    end
  end
end
