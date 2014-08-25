class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.belongs_to :customer, index: true
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
