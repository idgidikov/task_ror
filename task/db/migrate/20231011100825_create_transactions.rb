class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.integer :reference_number
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
