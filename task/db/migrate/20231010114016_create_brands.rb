class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.string :redemption , default: "online"

      t.timestamps
    end
  end
end
