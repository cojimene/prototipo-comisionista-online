class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.references :user, foreign_key: true
      t.string :property_type
      t.decimal :area, precision: 7, scale: 2
      t.integer :rooms
      t.integer :bathrooms
      t.integer :price
      t.integer :age
      t.integer :stratum
      t.integer :floor
      t.text :description
      t.integer :parkings
      t.string :neighborhood
      t.string :address
      t.string :city
      t.string :availability

      t.timestamps
    end
  end
end
