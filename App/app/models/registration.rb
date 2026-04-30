class Registration < ApplicationRecord
  enum :status, {
    confirmed: 0,
    waitlisted: 1,
    cancelled: 2
  }, default: :confirmed

  belongs_to :user
  belongs_to :event

  validates :status, :registered_at, presence: true
  validates :user_id, uniqueness: {
    scope: :event_id,
    message: "is already registered for this event"
  }

  validates :waitlist_position,
            numericality: { only_integer: true, greater_than: 0 },
            allow_nil: true

  validate :event_must_accept_registrations
  validate :waitlisted_registration_must_have_position
  validate :confirmed_registration_must_not_have_waitlist_position

  before_validation :set_registered_at, on: :create

  private

  def set_registered_at
    self.registered_at ||= Time.current
  end

  def event_must_accept_registrations
    return if event.blank?
    return if cancelled?

    if event.cancelled?
      errors.add(:event, "is cancelled")
    elsif event.completed?
      errors.add(:event, "has already ended")
    elsif event.ongoing?
      errors.add(:event, "has already started")
    end
  end

  def waitlisted_registration_must_have_position
    return unless waitlisted?

    errors.add(:waitlist_position, "must be present for waitlisted registrations") if waitlist_position.blank?
  end

  def confirmed_registration_must_not_have_waitlist_position
    return unless confirmed?

    errors.add(:waitlist_position, "must be blank for confirmed registrations") if waitlist_position.present?
  end
end