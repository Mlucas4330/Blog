class Api::V1::RepliesController < ApplicationController
  before_action :set_reply, only: %i[ like update destroy ]
  before_action :authorize

  def create
    @reply = @user.replies.new(reply_params)
  
    if @reply.save
      render json: { reply: @reply, message: 'Reply created successfully' }, status: :created
    else
      render json: { error: @reply.errors }, status: :unprocessable_entity
    end
  end
  
  def update
    if @reply.update(reply_params)
        render json: { reply: @reply, message: 'Reply edited successfully' }, status: :ok
    else
        render json: { error: @reply.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @reply.destroy
    render json: { message: 'Reply deleted successfully' }
  end

  def like
    @reply.increment!(:likes)
    render json: { message: 'Reply liked successfully' }, status: :ok
  end

  private
  def set_reply
    @reply = Reply.find(params[:id])
  end
  def reply_params
    params.permit(:body, :comment_id)
  end
end
