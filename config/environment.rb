# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

Akismet.api_key = 'fsdfsdf'
Akismet.app_url = 'https://test'

# Initialize the Rails application.
Rails.application.initialize!
