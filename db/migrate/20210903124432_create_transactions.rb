class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.belongs_to :stocks, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.boolean :buy
      t.boolean :sell
      t.decimal :price, precision: 10, scale: 2
      t.integer :quantity

      t.timestamps
    end
  end
end
