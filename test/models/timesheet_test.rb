require 'test_helper'

class TimesheetTest < ActiveSupport::TestCase

  test 'should save timesheet' do
    timesheet = Timesheet.new
    assert !timesheet.save
  end

  test 'should have date of entry' do
    timesheet = Timesheet.new(date: ' ')
    assert_not timesheet.valid?
  end

  test 'should not have date in the future' do
    timesheet = Timesheet.new(date: Time.now + 2.days)
    assert timesheet.date.future?
  end

  test 'should have a start time' do
    timesheet = Timesheet.new(start_time: ' ')
    assert_not timesheet.valid?
  end

  test 'should have a finish time' do
    timesheet = Timesheet.new(finish_time: ' ')
    assert_not timesheet.valid?
  end

  test 'should have start time before finish time' do
    timesheet = Timesheet.new(start_time: 1.hour.ago , finish_time: 2.hours.ago)
    assert_not timesheet.start_time.future?
  end
end
