class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[ like update destroy ]
  before_action :authenticate_user!, except: :index

  def index
    post = Post.find(params[:post_id])
    @comments = post.comments

    if @comments.empty?
      render status: :no_content
    else
      render json: @comments, include: :replies
    end
  end

  def show
    @comment = Comment.where(:id => params[:id])

    if @comment.exists?
      render json: @comment, include: :replies
      
    else
      render json: { message: 'Comentário não foi encontrado' }, status: :not_found
    end
  end

  def create
    @comment = @user.comments.new(comment_params)

  if @comment.save
    render status: :created
  else
    render json: { errors: @comment.errors }, status: :unprocessable_entity
  end
  end

  def update
    if @comment.update(comment_params)
        render status: :ok
    else
        render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    render json: { message: 'Comentário excluído com sucesso' }, status: :ok
  end

  def like
    @comment.increment!(:likes)
  end


  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
  def comment_params
    params.permit(:body, :post_id)
  end
end
