# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.boolean :activated, null: false
      t.string :email, null: false
      t.string :name
      t.string :uid, null: false

      t.timestamps
    end
  end
end
