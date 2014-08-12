class ChangeDescriptionTypeOnProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.change :description, :text
    end
  end
end
