require 'test_helper'

class CharsControllerTest < ActionController::TestCase
  setup do
    @char = chars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create char" do
    assert_difference('Char.count') do
      post :create, char: @char.attributes
    end

    assert_redirected_to char_path(assigns(:char))
  end

  test "should show char" do
    get :show, id: @char.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @char.to_param
    assert_response :success
  end

  test "should update char" do
    put :update, id: @char.to_param, char: @char.attributes
    assert_redirected_to char_path(assigns(:char))
  end

  test "should destroy char" do
    assert_difference('Char.count', -1) do
      delete :destroy, id: @char.to_param
    end

    assert_redirected_to chars_path
  end
end
