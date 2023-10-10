class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :amount
      t.references :brand, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
