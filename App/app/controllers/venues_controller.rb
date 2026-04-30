class VenuesController < ApplicationController
  def index
    @venues = Venue
              .includes(:events)
              .order(:name)
  end

  def show
    @venue = Venue
             .includes(events: [:organizer, :category])
             .find(params[:id])
  end
end