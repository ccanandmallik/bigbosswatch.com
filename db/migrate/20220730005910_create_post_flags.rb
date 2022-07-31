# frozen_string_literal: true

class CreatePostFlags < ActiveRecord::Migration[7.0]
  def change
    create_table :post_flags do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :flag_type
      t.string :user_ip
      t.string :user_agent

      t.timestamps
    end
  end
end
