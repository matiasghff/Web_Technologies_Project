class Category < ApplicationRecord
  has_many :events, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
end