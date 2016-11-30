require 'test_helper'

class OrderLineItemsControllerTest < ActionController::TestCase
  setup do
    @order_line_item = order_line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_line_item" do
    assert_difference('OrderLineItem.count') do
      post :create, order_line_item: { order_id: @order_line_item.order_id, price: @order_line_item.price, product_id: @order_line_item.product_id, quantity: @order_line_item.quantity, user_profile_id: @order_line_item.user_profile_id }
    end

    assert_redirected_to order_line_item_path(assigns(:order_line_item))
  end

  test "should show order_line_item" do
    get :show, id: @order_line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_line_item
    assert_response :success
  end

  test "should update order_line_item" do
    patch :update, id: @order_line_item, order_line_item: { order_id: @order_line_item.order_id, price: @order_line_item.price, product_id: @order_line_item.product_id, quantity: @order_line_item.quantity, user_profile_id: @order_line_item.user_profile_id }
    assert_redirected_to order_line_item_path(assigns(:order_line_item))
  end

  test "should destroy order_line_item" do
    assert_difference('OrderLineItem.count', -1) do
      delete :destroy, id: @order_line_item
    end

    assert_redirected_to order_line_items_path
  end
end
