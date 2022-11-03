# frozen_string_literal: true

# IsNotOwner custom validator
class IsNotOwner < ActiveModel::Validator
  def validate(record)
    # puts record.guest.nil?
    Listing.where(id: record.listing_id) do |listing|
      next unless record.guest_id == listing.user_id

      record.errors.add :base, 'The owner cannot be the guest'
    end
  end
end
