class PagesController < ApplicationController
  def index
    @timesheets = Timesheet.all
  end

end