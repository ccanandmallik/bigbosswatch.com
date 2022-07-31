# frozen_string_literal: true

# Transaction class
class NewPostTransaction < BigBossTransaction
  attr_accessor :post

  def initialize(params, post)
    super(params)
    @post = post
  end

  def run!
    if @params[:company_name].present?
      create_company! @params[:company_name]
      attempt_save! true
    else
      attempt_save! false
    end
  end

  def create_company!(name)
    @post.company = Company.find_or_create_by!(name: name)
  rescue StandardError => e
    @post.errors.add(:company_id, 'Phrasing -- that company name likely pissed off our profanity filter, try again.')
    throw e
  end

  def attempt_save!(new_company)
    begin
      @post.save!
    rescue StandardError => e
      Company.find(@post.company_id).destroy if new_company
      @post.company_id = nil
      throw e
    end

    @post.valid?
  end
end
