class IsNotBooked < ActiveModel::Validator
  def validate(record)
    reservations = Reservation.all
    reservations.each do |res|
      if (res.start_date..res.end_date).overlaps?(record.start_date..record.end_date) 
        record.error.add :base, "The reservations overlap"
      end
    end
  end
end

# class IsNotOwner < ActiveModel::Validator
#   def validate(record)
#     reservation = record
#     if (reservation[user] == record.guest)
#       record.error.add :base, "The owner cannot be the guest"
#     end
#   end
# end






class Reservation < ApplicationRecord
  validates_comparison_of :start_date, less_than: :end_date
  validates_with IsNotBooked

  belongs_to :listing
  belongs_to :guest, class_name: "User"
 # validates_with IsNotOwner


  def duration_of_reservation()
    t1 = self.start_date
    t2 = self.end_date
    t1.ti_i - t2.to_i    
  end


end
