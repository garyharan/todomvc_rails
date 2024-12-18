require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should create item" do
    assert_difference("Item.count") do
      post items_url, params: { item: { body: @item.body, completed_at: @item.completed_at } }
    end

    assert_redirected_to items_url
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { body: @item.body, completed_at: @item.completed_at } }
    assert_redirected_to item_url(@item)
  end
end
