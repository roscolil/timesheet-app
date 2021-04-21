class TimesheetsController < ApplicationController
  
  def new
    @timesheet = Timesheet.new
  end
  
  def create
    @timesheet = Timesheet.new(timesheet_params)
    get_total_pay(@timesheet.date, @timesheet.start_time, @timesheet.finish_time)

    @timesheet.save
    if @timesheet.save
      flash[:notice] = "Timesheet was created successfully."
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def timesheet_params
    params.require(:timesheet).permit(:date, :start_time, :finish_time, :total_pay)
  end

  def get_total_pay(date, start_time, finish_time)
    day_of_week = date.strftime("%A")
    rates_for_day = Rate.where(day: day_of_week)
    start_time = long_time_to_minutes(start_time)
    finish_time = long_time_to_minutes(finish_time)
    total_pay = 0

    while start_time < finish_time do
      current_rate = rates_for_day.each.select { |r| str_time_to_minutes(r.start) <= start_time && str_time_to_minutes(r.end) > start_time }[0]
      total_pay += (current_rate.rate.to_f / 60) * ([(str_time_to_minutes(current_rate.end) + 1), finish_time].min - start_time)
      time_worked = [(str_time_to_minutes(current_rate.end) + 1), finish_time].min 
      start_time = time_worked
    end
    return @timesheet.total_pay = total_pay
  end

  #  Extract time as minute(integer) from long date/time
  def long_time_to_minutes(str) 
    time = str.strftime("%H:%M")
    hrs, mins = time.split(':').map(&:to_i)
    60 * hrs + mins
  end

  # Set 24hr time string to minutes(integer)
  def str_time_to_minutes(str)   
    hrs, mins = str.split(':').map(&:to_i)
    60 * hrs + mins
  end
end
