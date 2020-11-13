class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 25 }
  validates :email, presence: true, length: { maximum: 105 }

  has_many :decors, dependent: :destroy
  has_many :categories

  def decors_with_no_category(decors)
    decors.select { |decor| decor.categories.empty? }
  end

  def sanitize
    @user = User.new
  end
end
