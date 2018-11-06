require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_url
    assert_response :success
  end

  test "should get club" do
    get club_url
    assert_response :success
  end

  test "should not show club, only login or signup when not connected" do
    get '/'
      assert_select "a[href=?]", club_path, count: 0
      assert_select "a[href=?]", login_path
      assert_select "a[href=?]", new_path
  end

  test "should show club, not login or signup when connected" do
    get new_path
      post new_path, params: { user: { first_name: 'test', last_name: 'test', mail: 'test', password: 'test' } }
      assert_redirected_to '/'
    get login_path
      post login_path, params: { session: { email: 'test', password: 'test' } }
      assert_redirected_to '/'
    follow_redirect!
      assert_select "a[href=?]", club_path
      assert_select "a[href=?]", login_path, count: 0
      assert_select "a[href=?]", signup_path, count: 0
  end


end
