class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :line_items
  has_many :products, :through => :line_items

  accepts_nested_attributes_for :line_items

  def total_price
    line_items.to_a.sum(&:total_price)
  end
end
