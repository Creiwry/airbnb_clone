# frozen_string_literal: true

# User model
class User < ApplicationRecord
  validates :email,
            presence: true,
            uniqueness: true,
            format:
            {
              with: /(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})/i,
              message: 'please enter a valid email'
            }

  validates :phone_number,
            presence: true
            # format:
            # {
            #   with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/,
            #   message: 'please enter a valid phone number'
            # }
  has_many :listings, foreign_key: "user_id", dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :listings, through: :reservations,
                      foreign_key: 'guest_id',
                      class_name: 'User'
end
