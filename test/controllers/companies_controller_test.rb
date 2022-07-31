# frozen_string_literal: true

require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should show company' do
    get company_url(@company)
    assert_response :success
  end
end
