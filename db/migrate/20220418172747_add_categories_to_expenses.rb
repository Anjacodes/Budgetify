class AddCategoriesToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :categories, :string
  end
end
