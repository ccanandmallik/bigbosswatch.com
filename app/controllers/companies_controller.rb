# frozen_string_literal: true

# Companies are controlled
class CompaniesController < ApplicationController
  # GET /companies
  def index
    @companies = Company.get_frontpage_listings(
      params[:name] || '',
      params[:page]
    )
  end

  # GET /companies/1
  def show
    @company = Company.find(params[:id])
  end
end
