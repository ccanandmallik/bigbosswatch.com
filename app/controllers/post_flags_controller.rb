# frozen_string_literal: true

# controls the post flags
class PostFlagsController < ApplicationController
  # GET /post_flags/:post_id/:flag_id
  def index
    @post_flag = PostFlag.new(post_flag_params)

    if @post_flag.save
      redirect_to post_url(@post_flag.post), notice: 'Post was flagged.'
    else
      redirect_to post_url(@post_flag.post), alert: 'You\'ve already flagged this post.'
    end
  end

  private

  def post_flag_params
    {
      post_id: params[:post_id],
      flag_type: params[:flag_id]
    }.merge(user_ip: request.ip, user_agent: request.user_agent)
  end
end
