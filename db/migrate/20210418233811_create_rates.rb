class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.string :day
      t.time :start
      t.time :end
    end
  end
end
