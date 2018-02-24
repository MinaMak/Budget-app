class ChangeValueToNumeric < ActiveRecord::Migration[5.1]
  def change
    change_column :expenses, :value, :numeric
  end
end
