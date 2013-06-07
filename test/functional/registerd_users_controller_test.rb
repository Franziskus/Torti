require 'test_helper'

class RegisterdUsersControllerTest < ActionController::TestCase
  setup do
    @registerd_user = registerd_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registerd_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registerd_user" do
    assert_difference('RegisterdUser.count') do
      post :create, registerd_user: { email: @registerd_user.email, id: @registerd_user.id, password: @registerd_user.password, registerdSince: @registerd_user.registerdSince, type: @registerd_user.type }
    end

    assert_redirected_to registerd_user_path(assigns(:registerd_user))
  end

  test "should show registerd_user" do
    get :show, id: @registerd_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registerd_user
    assert_response :success
  end

  test "should update registerd_user" do
    put :update, id: @registerd_user, registerd_user: { email: @registerd_user.email, id: @registerd_user.id, password: @registerd_user.password, registerdSince: @registerd_user.registerdSince, type: @registerd_user.type }
    assert_redirected_to registerd_user_path(assigns(:registerd_user))
  end

  test "should destroy registerd_user" do
    assert_difference('RegisterdUser.count', -1) do
      delete :destroy, id: @registerd_user
    end

    assert_redirected_to registerd_users_path
  end
end
