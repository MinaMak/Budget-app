class AddUserIdToExpensesCategories < ActiveRecord::Migration[5.1]
  def change
    Category.where(name: "All").destroy_all
    add_column :expenses, :user_id, :integer
    add_index :expenses, :user_id

    add_column :categories, :user_id, :integer
    add_index :categories, :user_id
    User.all.categories.create name: "Other"
  end
end
