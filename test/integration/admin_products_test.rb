require 'test_helper'

class AdminProductsTest < ActionDispatch::IntegrationTest
  def test_products_crud
    visit "/admin/products"
    click_on "Add New Product"
    fill_in "Name", with: 'Shoes'
    fill_in "Price", with: '123.45'
    click_on "Create Product"
    product_id = Product.last.id
    page.has_content?("Product #{product_id} was created")
    click_on "Edit product"
    fill_in "Price", with: '17.99'
    click_on "Update Product"
    page.has_content?("Product #{product_id} was updated")
    assert page.has_content?('17.99')
    click_on "Delete product"
    page.has_content?("Product #{product_id} was deleted")
    refute page.has_content?('Test')
    save_screenshot('screenshot.png', :full => true)
  end
end
