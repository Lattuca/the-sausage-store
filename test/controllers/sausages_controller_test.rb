require 'test_helper'

class SausagesControllerTest < ActionController::TestCase
  setup do
    @sausage = sausages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sausages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sausage" do
    assert_difference('Sausage.count') do
      post :create, sausage: { calories: @sausage.calories, description: @sausage.description, fresh: @sausage.fresh, name: @sausage.name, price: @sausage.price, qty: @sausage.qty }
    end

    assert_redirected_to sausage_path(assigns(:sausage))
  end

  test "should show sausage" do
    get :show, id: @sausage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sausage
    assert_response :success
  end

  test "should update sausage" do
    patch :update, id: @sausage, sausage: { calories: @sausage.calories, description: @sausage.description, fresh: @sausage.fresh, name: @sausage.name, price: @sausage.price, qty: @sausage.qty }
    assert_redirected_to sausage_path(assigns(:sausage))
  end

  test "should destroy sausage" do
    assert_difference('Sausage.count', -1) do
      delete :destroy, id: @sausage
    end

    assert_redirected_to sausages_path
  end
end
