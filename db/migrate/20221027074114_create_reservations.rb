# frozen_string_literal: true

# Create table for Reservation model
class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :guest, index: true
      t.belongs_to :listing, index: true
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
