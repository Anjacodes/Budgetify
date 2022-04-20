json.extract! expense_category, :id, :category_id, :expense_id, :created_at, :updated_at
json.url expense_category_url(expense_category, format: :json)
