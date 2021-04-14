class Timesheet < ApplicationRecord
  validates :date, presence: { message: "Date is required"}
  validates :start_time, presence: { message: "Start time is required"}
  validates :finish_time, presence: { message: "Finish time is required"}
end