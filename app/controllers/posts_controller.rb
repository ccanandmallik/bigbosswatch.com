# frozen_string_literal: true

# Controller for Posts
class PostsController < ApplicationController
  # POST /posts
  def create
    @post = Post.new(post_params.except(:company_name))

    if NewPostTransaction.new(post_params, @post).run
      redirect_to post_url(@post), notice: 'Post was successfully created.'
      ProcessPostJob.perform_later @post, request.ip, request.user_agent
    else
      @companies = companies_list
      render :new, status: :unprocessable_entity
    end
  end

  # GET /posts/new
  def new
    @companies = companies_list
    @post = Post.new
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(
      :content, :company_id, :company_name,
      location_type: [],
      media_type: [],
      device_type: [],
      certainty_type: [],
      intent_type: [],
      maturity_type: []
    ).merge(user_ip: request.ip, user_agent: request.user_agent)
  end

  def companies_list
    Company
      .left_joins(:posts)
      .group(:id)
      .order('COUNT(posts.id) DESC')
      .select(:id, :name)
  end
end
