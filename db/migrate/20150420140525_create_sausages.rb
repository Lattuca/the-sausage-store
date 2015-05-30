class CreateSausages < ActiveRecord::Migration
  def change
    create_table :sausages do |t|
      t.string :name
      t.string :description
      t.integer :qty
      t.boolean :fresh
      t.integer :calories
      t.float :price

      t.timestamps null: false
    end
  end
end
