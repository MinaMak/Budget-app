module ExpensesHelper
  def sum_expenses_value
    sum = 0
    @expenses.all.each do |expense|
      sum += expense.value
    end
    sum
  end

  def categories_options
    options = Category.all.collect {|c| [c.name, c.id]}
    options.unshift ["All", 0]
    options
  end
end
