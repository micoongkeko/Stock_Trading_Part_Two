class FixTransactionTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :transactions, :stocks_id, :stock_id
    change_column :transactions, :price, :decimal, :precision => 5, :scale => 2
  end
end
