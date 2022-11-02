# frozen_string_literal: true

# Create table for User model
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.integer :phone_number
      t.text :description
      t.timestamps
    end
  end
end
