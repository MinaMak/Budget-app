class ChangeValueToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :expenses, :value, :decimal
  end
end
