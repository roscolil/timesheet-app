class ChangeTimeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :rates, :start, :string
    change_column :rates, :end, :string
  end
end
