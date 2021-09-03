class RemoveBrokerRole < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :broker_role
  end
end
