class ChangePriceTypeForProperties < ActiveRecord::Migration[5.1]

  def up
    change_column :properties, :price, :integer, limit: 8
  end

  def down
    change_column :properties, :price, :integer, limit: 4
  end

end
