class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :status , default: 'available'
      t.references :product, null: false, foreign_key: true
      t.decimal :amount
      t.integer :activation_number

      t.timestamps
    end
  end
end
