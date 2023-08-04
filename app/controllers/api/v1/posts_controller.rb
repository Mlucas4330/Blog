class Api::V1::PostsController < ApplicationController
before_action :set_post, only: %i[ like update destroy ]
# before_action :authorize, except: :index

def index
  @posts = Post.all

  if @posts.empty?
    render status: :no_content
  else
    render json: @posts
  end
end

def show
  @post = Post.where(:id => params[:id])

  if @post.exists?
    render json: @post
  else
    render json: { message: 'Publicação não foi encontrada' }, status: :not_found
  end
end

def create
  authorize()
  return
  render json: @user.inspect
  return 
  @post = @user.posts.new(post_params)

  if @post.save
    render json: { message: 'Publicação criada com sucesso' }, status: :created
  else
    render json: { errors: @post.errors }, status: :unprocessable_entity
  end
end

def update
    if @post.update(post_params)
        render json: { message: 'Publicação editada com sucesso' }
    else
        render json: { errors: @post.errors }, status: :unprocessable_entity
    end
end

def destroy
  @post.destroy
  render json: { message: 'Publicação excluída com sucesso' }
end

def like
  @post.increment!(:likes)
end

private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
  params.permit(:title, :body)
  end
end

