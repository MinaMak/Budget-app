class ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
    if params[:category_id].present?
      @category = Category.find params[:category_id]
      @expenses = @expenses.where category_id: params[:category_id]
    end
  end

  def new
    @expense = Expense.new
  end

  def edit
    @expense = Expense.find params[:id]
  end

  def create
    expense = Expense.new expense_params
    if expense.save
      redirect_to expenses_path
    else
      @expense = expense
      render 'new'
    end
  end

  def update
    expense = Expense.find params[:id]
    if expense.update expense_params
      redirect_to expenses_path
    else
      @expense = expense
      render 'edit'
    end
  end

  def destroy
    expense = Expense.find params[:id]
    expense.destroy
    redirect_to expenses_path
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :value, :date, :category_id)
  end

end
