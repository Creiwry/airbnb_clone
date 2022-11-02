# frozen_string_literal: true

# Create table for Listing model
class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.integer :available_beds
      t.integer :price
      t.text :description
      t.boolean :has_wifi
      t.text :welcome_message
      t.belongs_to :user, index: true
      t.belongs_to :city, index: true
      t.timestamps
    end
  end
end
