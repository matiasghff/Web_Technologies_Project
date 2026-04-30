class Event < ApplicationRecord
  enum :status, {
    draft: 0,
    published: 1,
    ongoing: 2,
    completed: 3,
    cancelled: 4
  }, default: :draft

  belongs_to :organizer,
             class_name: "User",
             inverse_of: :organized_events

  belongs_to :category
  belongs_to :venue

  has_many :registrations, dependent: :destroy
  has_many :registered_users, through: :registrations, source: :user

  has_many :reviews, dependent: :destroy
  has_many :reviewers, through: :reviews, source: :user

  validates :title, :status, :starts_at, :ends_at, :max_attendees, presence: true
  validates :max_attendees, numericality: { only_integer: true, greater_than: 0 }

  validate :ends_at_after_starts_at
  validate :max_attendees_cannot_exceed_venue_capacity

  def confirmed_registrations
    registrations.confirmed
  end

  def waitlisted_registrations
    registrations.waitlisted.order(:waitlist_position)
  end

  def cancelled_registrations
    registrations.cancelled
  end

  def confirmed_attendees_count
    confirmed_registrations.count
  end

  def available_spots
    [max_attendees - confirmed_attendees_count, 0].max
  end

  def full?
    available_spots.zero?
  end

  def average_rating
    return nil if reviews.empty?

    reviews.average(:rating).to_f.round(1)
  end

  private

  def ends_at_after_starts_at
    return if starts_at.blank? || ends_at.blank?

    errors.add(:ends_at, "must be after the start date and time") if ends_at <= starts_at
  end

  def max_attendees_cannot_exceed_venue_capacity
    return if venue.blank? || max_attendees.blank? || venue.max_capacity.blank?

    if max_attendees > venue.max_capacity
      errors.add(:max_attendees, "cannot exceed the venue capacity")
    end
  end
end