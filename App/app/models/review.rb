class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :rating, :comment, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }

  validates :user_id, uniqueness: {
    scope: :event_id,
    message: "has already reviewed this event"
  }

  validate :event_must_be_completed
  validate :user_must_have_attended_event

  private

  def event_must_be_completed
    return if event.blank?

    errors.add(:event, "must be completed before it can be reviewed") unless event.completed?
  end

  def user_must_have_attended_event
    return if user.blank? || event.blank?

    attended = event.registrations.confirmed.exists?(user_id: user.id)

    errors.add(:user, "must have attended the event before reviewing it") unless attended
  end
end