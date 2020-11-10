class RemoveForeignKeyFromCategoriesTable < ActiveRecord::Migration[6.0]
  def change
    remove_reference :categories, :user
  end
end
