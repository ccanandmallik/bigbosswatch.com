# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Akismet.api_key = ENV['ASKIMET_API_KEY']
Akismet.app_url = ENV['ASKIMET_APP_URL']
