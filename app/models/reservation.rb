# frozen_string_literal: true
require_relative './validators/is_not_booked_validator.rb'
require_relative './validators/is_not_owner_validator.rb'

# Reservation model
class Reservation < ApplicationRecord
  validates_comparison_of :start_date, less_than: :end_date
  validates_with IsNotBooked
  belongs_to :listing
  belongs_to :guest, foreign_key: "guest_id", class_name: 'User'
  validates_with IsNotOwner

  def duration_of_reservation
    start_date.ti_i - end_date.to_i
  end
end
