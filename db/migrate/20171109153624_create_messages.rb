class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.integer :recipient_id, foreign_key: true, index: true
      t.string :subject
      t.text :content
      t.boolean :urgent

      t.timestamps
    end
  end
end
