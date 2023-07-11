class PitchBooking < ApplicationRecord
  enum status: {pending: 0, approved: 1, cancelled: 2}, _suffix: true

  belongs_to :user
  belongs_to :pitch
  has_many :pitch_booking_services, dependent: :destroy
  has_many :services, through: :pitch_booking_services
  accepts_nested_attributes_for :pitch_booking_services, allow_destroy: true

  delegate :name, to: :user, prefix: true
  delegate :name, to: :pitch, prefix: true
end
