# frozen_string_literal: true

json.extract! post, :id, :content, :user_ip, :user_agent, :company_id, :location_type, :media_type, :device_type,
              :certainty_type, :intent_type, :maturity_type, :approved, :processed, :created_at, :updated_at
json.url post_url(post, format: :json)
