class RenameBrokerToTrader < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :buyer_role, :trader_role
  end
end
