class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.boolean :active
      t.integer :quantity

      t.timestamps
    end
  end
end
