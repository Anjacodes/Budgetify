class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[edit update destroy]

  # GET /expenses or /expenses.json
  def index
    @category = Category.find(params[:category_id])
    @expenses = []
    @total = 0
    @category.expense_categories.order(created_at: :desc).each do |expense_category|
      @expenses.push(expense_category.expense)
      @total += expense_category.expense.amount
    end
  end

  # GET /expenses/1 or /expenses/1.json
  def show
    @category = Category.find(params[:category_id])
    @expenses = []
    @category.expenses.where(id: params[:id]).each do |expense_category|
      @expenses << expense_category
    end
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @param = params['format']
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses or /expenses.json
  def create
    @expense = current_user.expenses.new(expense_params)

    respond_to do |format|
      if @expense.save
        ExpenseCategory.create(category_id: params[:category_id], expense_id: @expense.id)
        format.html do
          redirect_to category_expenses_path(params[:category_id]), notice: 'Expense was successfully created.'
        end
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expense_url(@expense), notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy

    respond_to do |format|
      format.html do
        redirect_to category_expenses_path(category_id: params[:category_id]),
                    notice: 'Expense was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :user_id)
  end
end
