# frozen_string_literal: true

# Posts
class Post < ApplicationRecord
  extend ArrayEnum

  belongs_to :company, touch: true
  has_many :post_flags

  scope :approved, -> { where(approved: true, processed: true) }
  scope :latest, -> { order(created_at: :desc) }

  validates :company_id, presence: true
  validates :content, presence: true
  validate :validate_user_ip
  validate :profanity

  array_enum media_type: {
    audio: 0,
    video: 1,
    text: 2,
    other: 3
  }

  array_enum location_type: {
    home: 0,
    office: 1,
    other: 3
  }

  array_enum device_type: {
    mobile: 0,
    computer: 1,
    other: 3
  }

  array_enum certainty_type: {
    suspicion: 0,
    personal: 1,
    legal: 2
  }

  array_enum intent_type: {
    benevolent: 0,
    maleovelant: 1,
    unknown: 2
  }

  array_enum maturity_type: {
    mature: 0,
    immature_socially: 1,
    immature_legally: 2
  }

  array_enum policy_comm_type: {
    unknown: 0,
    in_writing: 1,
    in_person: 2
  }

  private

  def validate_user_ip
    return unless Post.where(user_ip: user_ip, created_at: 3.weeks.ago..DateTime.now).count >= 3

    errors.add(:user_ip, 'Each IP Address is limited to three posts every 3 weeks.')
  end

  def profanity
    return unless ProfanityFilter::Base.profane?(content)

    errors.add(:content, 'Phrasing -- our profanity filter picked up something in your content, try again.')
  end
end
