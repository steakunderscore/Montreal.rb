class EventsController < ApplicationController
  def index
    time = Time.zone.now
    @upcoming_events = Event.where("starts_at >= ?", time)
    @past_events = Event.where("starts_at < ?", time)
  end

  def show
    @event = Event.find(params[:id])
  end
end
