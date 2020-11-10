class Decor < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id, message: 'already exists!', case_sensitive: false }
  validates :price, presence: true

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :with_no_category, -> { where(category_id: nil) }
end
