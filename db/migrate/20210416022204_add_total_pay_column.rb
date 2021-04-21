class AddTotalPayColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :timesheets, :total_pay, :decimal
  end
end
