# frozen_string_literal: true

class AddPolicyCommTypeEnum < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :policy_comm_type, :integer, array: true
  end
end
