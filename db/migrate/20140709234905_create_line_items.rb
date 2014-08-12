class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
