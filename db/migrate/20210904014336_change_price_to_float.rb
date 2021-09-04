class ChangePriceToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :stocks, :price, :decimal
    change_column :transactions, :price, :decimal
  end
end
