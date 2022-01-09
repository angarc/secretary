class DashboardController < ApplicationController
  include GoogleCalendarService
  before_action :authenticate_user!

  def index
    client = get_google_calendar_client(current_user)
    calendar_list_response = client.list_calendar_lists()

    now = DateTime.now
    one_week_from_now = (now + 1.week)

    @calendars = calendar_list_response.items
    @events = []
    @calendars.each do |calendar|
      event_list_response = client.list_events(calendar.id, single_events: true, time_min: now, time_max: one_week_from_now)
      @events << event_list_response.items
    end

    @events = @events.flatten
    @tasks = current_user.tasks
  end
end
