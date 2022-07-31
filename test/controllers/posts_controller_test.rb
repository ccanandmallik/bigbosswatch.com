# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "shouldn't allow user to set processed or approved states" do
    post posts_url, params: {
      post: {
        processed: true,
        approved: true,
        certainty_type: @post.certainty_type,
        company_id: @post.company_id,
        content: @post.content,
        media_type: @post.media_type,
        device_type: @post.device_type,
        intent_type: @post.intent_type,
        location_type: @post.location_type,
        maturity_type: @post.maturity_type
      }
    }

    assert_equal false, Post.last.processed
    assert_equal false, Post.last.approved
  end

  test 'should create post with correct info' do
    assert_difference('Post.count') do
      post posts_url, params: {
        post: {
          certainty_type: @post.certainty_type,
          company_id: @post.company_id,
          content: @post.content,
          media_type: @post.media_type,
          device_type: @post.device_type,
          intent_type: @post.intent_type,
          location_type: @post.location_type,
          maturity_type: @post.maturity_type
        }
      }
    end

    assert_redirected_to post_url(Post.last)
    assert_equal @post.content, Post.last.content
    assert_equal @post.certainty_type, Post.last.certainty_type
  end

  test 'should show post' do
    get post_url(@post), as: :json
    assert_response :success
  end
end
