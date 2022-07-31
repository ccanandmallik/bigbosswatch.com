# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test 'the truth' do
  #   assert true
  # end
  #
  test 'the same IP address can\'t generate more than one post every 3 weeks' do
    posts(:one).user_ip = 'test'
    posts(:one).save

    posts(:two).user_ip = 'test'
    posts(:two).save

    posts(:three).user_ip = 'test'
    posts(:three).save

    post = Post.new(company: companies(:one), content: 'content', user_ip: 'test')
    post.save

    assert_not_empty post.errors
    assert_includes post.errors.first.full_message, 'IP'
  end
end
