class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, 
  :with => /(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})/i
  validates :phone_number, presence: true #format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "please enter a valid phone number" }
  has_many :listings
  has_many :reservations
  has_many :listings, through: :reservations, foreign_key: 'guest_id', class_name: "Reservation"

end
