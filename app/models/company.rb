# frozen_string_literal: true

# Company class
class Company < ApplicationRecord
  has_many :posts

  validates :name, presence: true, uniqueness: true
  validate :profanity

  def self.get_frontpage_listings(name, page)
    where('lower(name) LIKE ?', "%#{sanitize_sql_like(name).downcase}%")
      .left_joins(:posts)
      .merge(Post.approved)
      .group(:id)
      .having('COUNT(posts.id) > 0')
      .order('COUNT(posts.id) DESC')
      .page(page)
  end

  private

  def profanity
    return unless ProfanityFilter::Base.profane?(name)

    errors.add(:name, 'Phrasing -- our profanity filter picked up something in your content, try again.')
  end
end
