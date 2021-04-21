class ChangeTimeColumnToText < ActiveRecord::Migration[6.1]
  def change
    change_column :rates, :start, :text
    change_column :rates, :end, :text
  end
end
