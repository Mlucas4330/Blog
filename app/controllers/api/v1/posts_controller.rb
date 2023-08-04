class Api::V1::PostsController < ApplicationController
before_action :set_post, only: %i[ like update destroy ]
before_action :authorize, except: %i[ index show ]

def index
  @posts = Post.all

  if @posts.empty?
    render json: { message: 'No post found'}, status: :no_content
  else
    render json: { posts: @posts, message: "#{@posts.length} posts found" }, status: :ok
  end
end

def show
  @post = Post.where(:id => params[:id])

  if @post.exists?
    render json: { post: @post }, include: { comments: { include: :replies } }, status: :ok
  else
    render json: { message: 'Post not found' }, status: :not_found
  end
end

def create
  @post = @user.posts.new(post_params)

  if @post.save
    render json: { post: @post, message: 'Post created successfully' }, status: :created
  else
    render json: { error: @post.errors }, status: :unprocessable_entity
  end
end

def update
    if @post.update(post_params)
        render json: { message: 'Post edited successfully' }, status: :ok
    else
        render json: { error: @post.errors }, status: :unprocessable_entity
    end
end

def destroy
  @post.destroy
  render json: { message: 'Post deleted successfully' }, status: :ok
end

def like
  @post.increment!(:likes)
  render json: { message: 'Post liked successfully'}, status: :ok
end

private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
  params.permit(:title, :body)
  end
end

