class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true

  has_many :decors, dependent: :destroy
  has_many :categories
end
