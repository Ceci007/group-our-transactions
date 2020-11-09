class Decor < ApplicationRecord
  belongs_to :user

  has_many :decor_categories
  has_many :categories, through: :decor_categories

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :with_no_category, -> { where(category_id: nil) }
end
