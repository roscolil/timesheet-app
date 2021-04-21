class AddRatesColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :rates, :rate, :decimal, precision: 2
  end
end
