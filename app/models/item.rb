class Item < ApplicationRecord
  after_create_commit { broadcast_item_count }
  after_update_commit { broadcast_item_count }
  after_destroy_commit { broadcast_item_count }

  scope :completed, -> { where.not(completed_at: nil) }

  def completed?
    completed_at.present?
  end

  private

  def broadcast_item_count
    broadcast_replace_to "items",
      target: "item_counter",
      partial: "items/footer",
      locals: { items: Item.all }
  end
end
