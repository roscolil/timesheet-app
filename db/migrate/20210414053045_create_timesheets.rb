class CreateTimesheets < ActiveRecord::Migration[6.1]
  def change
    create_table :timesheets do |t|
      t.datetime :date 
      t.datetime :start_time
      t.datetime :finish_time
    end
  end
end
