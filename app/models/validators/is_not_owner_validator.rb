# frozen_string_literal: true

# IsNotOwner custom validator
class IsNotOwner < ActiveModel::Validator
  def validate(record)
    return unless record.user == record.guest

    record.errors.add :base, 'The owner cannot be the guest'
  end
end
