class UsersController < ApplicationController
  def index
    @users = User
             .includes(:organized_events, :registrations, :reviews)
             .order(:last_name, :first_name)
  end

  def show
    @user = User
            .includes(
              organized_events: [:category, :venue],
              registrations: [:event],
              reviews: [:event]
            )
            .find(params[:id])
  end
end