class RegistrationsController < ApplicationController
  def index
    @registrations = Registration
                     .includes(:user, event: [:category, :venue])
                     .order(registered_at: :desc)
  end

  def show
    @registration = Registration
                    .includes(:user, event: [:category, :venue, :organizer])
                    .find(params[:id])
  end
end