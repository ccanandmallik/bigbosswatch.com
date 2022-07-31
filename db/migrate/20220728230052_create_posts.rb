# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.string :user_ip
      t.string :user_agent
      t.references :company, null: false, foreign_key: true
      t.integer :media_type, array: true
      t.integer :location_type, array: true
      t.integer :device_type, array: true
      t.integer :certainty_type, array: true
      t.integer :intent_type, array: true
      t.integer :maturity_type, array: true
      t.boolean :approved, null: false, default: false
      t.boolean :processed, null: false, default: false
      t.boolean :is_akismet_blatant

      t.timestamps
    end
  end
end
