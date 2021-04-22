# WEPLOY TIMESHEET APP

### By Ross Lillis

This app was generated using the latest version of rails.

`bundle install`

`rails db:setup`

`rails db:seed` to seed rates table

`rails s`

This app includes the following assumtions:

- erb templating with formatting in view
- added bootstrap for basic styling
- used date/time select dropdowns in form (blank by default)
- utilized 'validates_timeliness' gem to provide additional validation methods for the timesheet model
- set application timezone to 'Melbourne'
- - Apologies for small bug with finish time dropdowns in form when save unsuccessful

Pay calculation logic:

1. Commence at the start time
2. Find the rate for that day/time
3. Calculate pay for time worked in that time period
4. Set the time up to the time calculated up to
5. Loop back to check if the entire timesheet has been calculated

### Version 2.0

- calendar popups/datepicker for dates and times
- currently for a single user. Add session info for multiple user logins (this would also stop errors for overlapping timesheet entries if more than 1 person starts at the same time)
- capacity to edit timesheets
- functionality to approve timesheets -> perhaps leverage mailer to notify employee
- additional styling and better user experience
- make responsive for all screen sizes
- store working hours & pay rates in a related database table
- capatity to calculate across all local time zones
