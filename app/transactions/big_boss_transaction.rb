# frozen_string_literal: true

# Transaction class
class BigBossTransaction
  attr_accessor :params

  # Add initializers as needed
  def initialize(params)
    @params = params
  end

  # Define a procedure that throws errors
  def run!; end

  def run
    run!
  rescue StandardError => e
    puts "DB Transaction failure -- #{e.message}"
    false
  end
end
