require "test_helper"

class ExpenseCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense_category = expense_categories(:one)
  end

  test "should get index" do
    get expense_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_expense_category_url
    assert_response :success
  end

  test "should create expense_category" do
    assert_difference("ExpenseCategory.count") do
      post expense_categories_url, params: { expense_category: { category_id: @expense_category.category_id, expense_id: @expense_category.expense_id } }
    end

    assert_redirected_to expense_category_url(ExpenseCategory.last)
  end

  test "should show expense_category" do
    get expense_category_url(@expense_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_expense_category_url(@expense_category)
    assert_response :success
  end

  test "should update expense_category" do
    patch expense_category_url(@expense_category), params: { expense_category: { category_id: @expense_category.category_id, expense_id: @expense_category.expense_id } }
    assert_redirected_to expense_category_url(@expense_category)
  end

  test "should destroy expense_category" do
    assert_difference("ExpenseCategory.count", -1) do
      delete expense_category_url(@expense_category)
    end

    assert_redirected_to expense_categories_url
  end
end
