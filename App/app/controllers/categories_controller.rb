class CategoriesController < ApplicationController
  def index
    @categories = Category
                  .includes(:events)
                  .order(:name)
  end

  def show
    @category = Category
                .includes(events: [:organizer, :venue])
                .find(params[:id])
  end
end