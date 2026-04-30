class ReviewsController < ApplicationController
  def index
    @reviews = Review
               .includes(:user, event: [:category, :venue])
               .order(created_at: :desc)
  end

  def show
    @review = Review
              .includes(:user, event: [:category, :venue, :organizer])
              .find(params[:id])
  end
end