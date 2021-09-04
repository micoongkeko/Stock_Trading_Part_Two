class RemovePrecisionAndScale < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :price, :decimal
  end
end
