require "application_system_test_case"

class ExpenseCategoriesTest < ApplicationSystemTestCase
  setup do
    @expense_category = expense_categories(:one)
  end

  test "visiting the index" do
    visit expense_categories_url
    assert_selector "h1", text: "Expense categories"
  end

  test "should create expense category" do
    visit expense_categories_url
    click_on "New expense category"

    fill_in "Category", with: @expense_category.category_id
    fill_in "Expense", with: @expense_category.expense_id
    click_on "Create Expense category"

    assert_text "Expense category was successfully created"
    click_on "Back"
  end

  test "should update Expense category" do
    visit expense_category_url(@expense_category)
    click_on "Edit this expense category", match: :first

    fill_in "Category", with: @expense_category.category_id
    fill_in "Expense", with: @expense_category.expense_id
    click_on "Update Expense category"

    assert_text "Expense category was successfully updated"
    click_on "Back"
  end

  test "should destroy Expense category" do
    visit expense_category_url(@expense_category)
    click_on "Destroy this expense category", match: :first

    assert_text "Expense category was successfully destroyed"
  end
end
