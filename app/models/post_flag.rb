# frozen_string_literal: true

# Post flag
class PostFlag < ApplicationRecord
  belongs_to :post, touch: true

  validates :post_id, presence: true
  validates :flag_type, presence: true
  validate :validate_user_ip

  scope :inappropriate, -> { where(flag_type: flag_type.inappropriate) }
  scope :astroturf, -> { where(flag_type: flag_type.astroturf) }

  enum flag_type: {
    inappropriate: 0,
    astroturf: 1
  }

  def validate_user_ip
    return unless PostFlag.exists?(user_ip: user_ip, post_id: post_id, flag_type: flag_type)

    errors.add(:user_ip, 'This post has been flagged already by this IP address.')
  end
end
