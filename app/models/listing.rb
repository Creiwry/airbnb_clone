class Listing < ApplicationRecord
  validates :available_beds, presence: true, comparison: { greater_than: 0}
  validates :price, presence: true, comparison: { greater_than: 0}
  validates :description, presence: true, length: { minimum: 140}
  validates :welcome_message, presence: true
  belongs_to :user
  belongs_to :city

  has_many :reservations
  has_many :guests, through: :reservations
end
