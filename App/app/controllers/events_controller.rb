class EventsController < ApplicationController
  def index
    @events = Event
              .includes(:category, :venue, :organizer, :registrations, :reviews)
              .order(starts_at: :asc)
  end

  def show
    @event = Event
             .includes(:category, :venue, :organizer, registrations: :user, reviews: :user)
             .find(params[:id])
  end
end