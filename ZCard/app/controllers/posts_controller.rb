class PostsController < ApplicationController

  before_action :set_board, only: [:new, :create] 
  before_action :set_post, only: [:show, :edit, :update]

  def new  
    @post = Post.new
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def create
    # @post = Post.new(post_params)
    # @post.board = @board
    # @post.user = current_user
    @post = current_user.posts.new(post_params)
    @post.board = @board
    if @post.save
      redirect_to @board, notice: "新增文章成功"
    else
      render :new
    end
  end

  def edit
    # @post = Post.find_by?(id: params[:id], user: current_user)
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "更新成功"
    else
      render :edit
    end
  end


  private
  def set_board
    @board = Board.find(params[:board_id])
  end

  def post_params 
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end
end