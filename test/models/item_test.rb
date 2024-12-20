require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "item is not complete by default" do
    item = items(:one)
    assert_not item.completed?, "Item should not be completed"
  end

  test "#grouped groups by completedness" do
    active_item = items(:one)
    completed_item = items(:two)

    grouped_items = Item.grouped

    assert_equal grouped_items["active"].map(&:id), [active_item].map(&:id), "Active item should be in the active group"
    assert_equal grouped_items["completed"].map(&:id), [completed_item].map(&:id), "Completed item should be in the completed group"
  end

end
