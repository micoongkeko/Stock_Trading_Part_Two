class ChangeDecToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :stocks, :price, :float
    change_column :transactions, :price, :float
  end
end
