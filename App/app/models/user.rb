class User < ApplicationRecord
  enum :role, {
    regular: 0,
    admin: 1
  }, default: :regular

  has_many :organized_events,
           class_name: "Event",
           foreign_key: "organizer_id",
           inverse_of: :organizer,
           dependent: :destroy

  has_many :registrations, dependent: :destroy
  has_many :registered_events, through: :registrations, source: :event

  has_many :reviews, dependent: :destroy
  has_many :reviewed_events, through: :reviews, source: :event

  validates :first_name, :last_name, :email, :role, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_validation :normalize_email

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end