class AddStateToCustomers < ActiveRecord::Migration
  def up
    add_column :customers, :state, :string
  end

  def down
  end
end
