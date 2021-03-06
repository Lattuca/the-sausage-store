class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :sausage, index: true
      t.belongs_to :cart, index: true

      t.timestamps null: false
    end
    add_foreign_key :line_items, :sausages
    add_foreign_key :line_items, :carts
  end
end
