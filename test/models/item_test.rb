require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "item is not complete by default" do
    item = items(:one)
    assert_not item.completed?, "Item should not be completed"
  end
end
