class Venue < ApplicationRecord
  has_many :events, dependent: :restrict_with_error

  validates :name, :building, :room, :address, :max_capacity, presence: true
  validates :max_capacity, numericality: { only_integer: true, greater_than: 0 }

  def full_location
    "#{building}, Room #{room} — #{address}"
  end
end