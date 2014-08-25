class AddCreditCardIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :credit_card_id, :integer
  end
end
