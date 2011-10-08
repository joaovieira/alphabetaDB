require 'test_helper'

class GlyphsControllerTest < ActionController::TestCase
  setup do
    @glyph = glyphs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:glyphs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create glyph" do
    assert_difference('Glyph.count') do
      post :create, glyph: @glyph.attributes
    end

    assert_redirected_to glyph_path(assigns(:glyph))
  end

  test "should show glyph" do
    get :show, id: @glyph.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @glyph.to_param
    assert_response :success
  end

  test "should update glyph" do
    put :update, id: @glyph.to_param, glyph: @glyph.attributes
    assert_redirected_to glyph_path(assigns(:glyph))
  end

  test "should destroy glyph" do
    assert_difference('Glyph.count', -1) do
      delete :destroy, id: @glyph.to_param
    end

    assert_redirected_to glyphs_path
  end
end
