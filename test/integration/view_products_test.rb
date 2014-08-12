require 'test_helper'

class ViewProductsTest < ActionDispatch::IntegrationTest
  def test_view_products
    visit "/"
    assert page.has_content?("$1,234.56"),
      'could not find product price'
    click_link 'Hat'
    assert page.has_content?('This is a hat'),
      'could not find product description'
    click_on 'Add to cart'
    assert page.has_content?('Shopping Cart'),
      'could not find page title'
    assert page.has_content?('$1,234.56'),
      'could not find total'
    click_link 'Hat'
    click_on 'Add to cart'
    assert page.has_content?('$2,469.12'),
      'could not find total'
  end
end
