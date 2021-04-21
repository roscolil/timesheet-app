class Timesheet < ApplicationRecord
  validates_date :date,
                  on_or_before: :today,
                  message: "cannot be in the future",
                  presence: true

  validates :start_time,
            presence: true

  validates_time :finish_time,
            after: :start_time,
            message: "can't be at or before your start time",
            presence: true

  validates_uniqueness_of :start_time, :finish_time

end