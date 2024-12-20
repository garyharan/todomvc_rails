class Item < ApplicationRecord
  scope :active, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }

  scope :grouped, -> {
    select("
      items.*,
      CASE
      WHEN completed_at IS NOT NULL THEN 'completed'
      ELSE 'active'
      END AS completion_status
    ").order(id: :desc).group_by(&:completion_status)
  }

  def completed?
    completed_at.present?
  end
end
