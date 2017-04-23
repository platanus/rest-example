class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :order, foreign_key: true
      t.string :name
      t.text :description
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
