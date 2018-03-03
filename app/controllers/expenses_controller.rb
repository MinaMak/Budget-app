class ExpensesController < ApplicationController

  def index
    @expenses = Expense.where(user_id: current_user.id).order(:date).paginate(page: params[:page], per_page: 10)
    if params[:category].present? && (category = Category.find_by_id params[:category]).present?
      @expenses = @expenses.where category: category
    end
    if params[:from_date].present? && params[:to_date].present?
      from_date = extract_date params[:from_date]
      to_date = extract_date params[:to_date]
      @expenses = @expenses.where 'date between ? and ?', from_date, to_date
    else
      @expenses = @expenses.where 'date between ? and ?', Date.today.beginning_of_month, Date.today.end_of_month
    end
    @sum_all_expenses = @expenses.sum :value
  end

  def new
    @expense = Expense.new
  end

  def edit
    @expense = Expense.find params[:id]
  end

  def create
    expense = Expense.new expense_params
    expense.user_id = current_user.id
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

  def extract_date(date)
    date_result = date['(1i)'] + '-' + date['(2i)'] + '-' + date['(3i)']
    date_result.to_date
  end

  def expense_params
    params.require(:expense).permit(:name, :value, :date, :category_id)
  end

end
