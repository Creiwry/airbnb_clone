# frozen_string_literal: true

# IsNotBooked custom validator
class IsNotBooked < ActiveModel::Validator
  def validate(record)
    Reservation.where(guest: record.guest).find_each do |res|
      if (res.start_date..res.end_date).overlaps?(record.start_date..record.end_date)
        record.errors.add :base, 'The reservations overlap'
      end
    end
  end
end
