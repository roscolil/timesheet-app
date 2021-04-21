class ChangeTotalPayFieldType < ActiveRecord::Migration[6.1]
  def change
    change_column :timesheets, :total_pay, :float
  end
end
