# frozen_string_literal: true

# Processes posts for appproval
class ProcessPostJob < ApplicationJob
  queue_as :default

  # performs the work
  def perform(post, ip, user_agent)
    if Rails.env.development?
      is_spam = false
      is_blatant = false
    else
      is_spam, is_blatant = Akismet.check(ip, user_agent, text: post.content)
    end

    post.update!(processed: true, approved: !is_spam, is_akismet_blatant: is_blatant)
  end
end
