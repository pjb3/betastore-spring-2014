require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_response :success
    assert_select "form[action=/subscriptions]"
    assert_select "input[name='subscription[email]']"
    assert_select "input[type=submit][value=Sign Up]"
  end

  def test_create
    assert_difference 'Subscription.count' do
      post :create, subscription: { email: 'test@example.com' }
    end
    subscription = Subscription.last
    assert_equal 'test@example.com', subscription.email
    assert_redirected_to subscription_path(subscription)
    assert_equal 'Subscription was successfully created.',
      flash[:notice]
  end
end
