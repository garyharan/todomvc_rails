require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get active items" do
    get active_items_url
    assert_response :success
    assert_not_nil assigns(:items)
    assigns(:items)["active"].each do |item|
      assert_nil item.completed_at
    end
  end

  test "should get completed items" do
    get completed_items_url
    assert_response :success
    assert_not_nil assigns(:items)
    assigns(:items)["completed"].each do |item|
      assert_not_nil item.completed_at
    end
  end

  test "should create item" do
    assert_difference("Item.count") do
      post items_url, params: { item: { body: @item.body, completed_at: @item.completed_at } }
    end

    assert_redirected_to items_url
  end

  test "should delete item" do
    assert_difference("Item.count", -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should toggle item completedness" do
    patch toggle_completed_item_url(@item)
    @item.reload
    assert_not_nil @item.completed_at

    patch toggle_completed_item_url(@item)
    @item.reload
    assert_nil @item.completed_at
  end

  test "should toggle all items" do
    patch toggle_all_items_url
    Item.all.each do |item|
      assert item.completed?
    end

    patch toggle_all_items_url
    Item.all.each do |item|
      assert_not item.completed?
    end
  end

  test "should update item" do
    patch item_url(@item), params: { item: { body: @item.body, completed_at: @item.completed_at } }
    assert_redirected_to item_url(@item)
  end
end
