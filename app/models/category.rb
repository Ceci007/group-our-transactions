class Category < ApplicationRecord
  belongs_to :user
  has_many :decor_categories
  has_many :decors, through: :decor_categories

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :icon, presence: true

  scope :alphabetical_order, -> { order(name: :asc) }
end
