class RemovePrecisionFromStocks < ActiveRecord::Migration[6.1]
  def change
    change_column :stocks, :price, :decimal
  end
end
