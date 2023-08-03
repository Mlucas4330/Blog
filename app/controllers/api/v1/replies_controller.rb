class Api::V1::RepliesController < ApplicationController
  before_action :set_reply, only: %i[ like update destroy ]
  before_action :authenticate_user!, except: :index

  def index
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:comment_id])
    @replies = comment.replies

    if @replies.empty?
      render status: :no_content
    else
      render json: @replies
    end
  end

  def show
    @reply = Reply.where(:id => params[:id])

    if @reply.exists?
      render json: @reply 
    else
      render json: { message: 'Resposta não foi encontrada' }, status: :not_found
    end
  end

  def create
    @reply = @user.replies.new(reply_params)
  
    if @reply.save
      render status: :created
    else
      render json: { errors: @reply.errors }, status: :unprocessable_entity
    end
  end
  
  def update
    if @reply.update(reply_params)
        render status: :ok
    else
        render json: { errors: @reply.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @reply.destroy
    render json: { message: 'Resposta excluída com sucesso' }
  end

  def like
    @reply.increment!(:likes)
  end

  private
  def set_reply
    @reply = Reply.find(params[:id])
  end
  def reply_params
    params.permit(:body, :post_id, :comment_id)
  end
end
