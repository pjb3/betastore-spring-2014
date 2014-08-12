require 'test_helper'

class ProductsTest < ActionDispatch::IntegrationTest

  def test_products
    visit "/"
    asset page.has_content?('Hat')
    refuter page.has_content?('Coat')
  end

end
