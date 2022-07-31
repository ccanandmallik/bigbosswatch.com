# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'visiting the index' do
    visit posts_url
    assert_selector 'h1', text: 'Posts'
  end

  test 'should create post' do
    visit posts_url
    click_on 'New post'

    fill_in 'Certainty type', with: @post.certainty_type
    check 'Approved' if @post.approved
    fill_in 'Company', with: @post.company_id
    fill_in 'Content', with: @post.content
    fill_in 'Device type', with: @post.device_type
    fill_in 'Intent type', with: @post.intent_type
    fill_in 'Location type', with: @post.location_type
    fill_in 'Maturity type', with: @post.maturity_type
    fill_in 'Media type', with: @post.media_type
    check 'Processed' if @post.processed
    fill_in 'User agent', with: @post.user_agent
    fill_in 'User ip', with: @post.user_ip
    click_on 'Create Post'

    assert_text 'Post was successfully created'
    click_on 'Back'
  end

  test 'should update Post' do
    visit post_url(@post)
    click_on 'Edit this post', match: :first

    fill_in 'Certainty type', with: @post.certainty_type
    check 'Approved' if @post.approved
    fill_in 'Company', with: @post.company_id
    fill_in 'Content', with: @post.content
    fill_in 'Device type', with: @post.device_type
    fill_in 'Intent type', with: @post.intent_type
    fill_in 'Location type', with: @post.location_type
    fill_in 'Maturity type', with: @post.maturity_type
    fill_in 'Media type', with: @post.media_type
    check 'Processed' if @post.processed
    fill_in 'User agent', with: @post.user_agent
    fill_in 'User ip', with: @post.user_ip
    click_on 'Update Post'

    assert_text 'Post was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Post' do
    visit post_url(@post)
    click_on 'Destroy this post', match: :first

    assert_text 'Post was successfully destroyed'
  end
end
