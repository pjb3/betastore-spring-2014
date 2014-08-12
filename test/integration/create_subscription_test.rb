require 'test_helper'

class CreateSubscriptionTest < ActionDispatch::IntegrationTest

  def test_create_subscription
    visit "/subscriptions/new"
    fill_in "Find out when we go live", with: 'test@example.com'
    click_on "Sign Up"
    assert page.has_content?('Subscription was successfully created.')
    assert_equal 'test@example.com', Subscription.last.email
  end

end
