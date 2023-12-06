# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.integer :priority

      t.timestamps
    end
  end
end
