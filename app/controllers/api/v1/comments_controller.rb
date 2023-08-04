class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[ like update destroy ]
  before_action :authorize

  def create
    @comment = @user.comments.new(comment_params)

  if @comment.save
    render json: { comment: @comment, message: 'Comment created successfuly' }, status: :created
  else
    render json: { error: @comment.errors }, status: :unprocessable_entity
  end
  end

  def update
    if @comment.update(comment_params)
        render json: { comment: @comment, message: 'Comment edited successfuly' }, status: :ok
    else
        render json: { error: @comment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    render json: { message: 'Comment deleted successfuly' }, status: :ok
  end

  def like
    @comment.increment!(:likes)
    render json: { message: 'Comment liked successfuly'}, status: :ok
  end


  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
  def comment_params
    params.permit(:body, :post_id)
  end
end
