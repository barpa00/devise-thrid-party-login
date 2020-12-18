class BoardsController < ApplicationController

  before_action :find_board, only: [:show, :edit, :update, :destroy]
                          # except: [:index, :new, :create]

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def show
    # @posts = Board.where(board_id: @board.id)
    @posts = @board.posts
  end

  def create
    # clean_params = params.require(:board).permit(:title)
    @board = Board.new(board_params)

    if @board.save
      # flash["notice"] = "成功新增看板"
      redirect_to "/", notice: '成功新增看板'
    else
      render :new
    end

  end

  def edit
    # @board = Board.find(params[:id])
    # find_board
  end

  def update
    # @board = Board.find(params[:id])
    # find_board
    # clean_params = params.require(:board).permit(:title)

    if @board.update(board_params)
      redirect_to "/", notice: '成功更新'
    else
      render :edit
    end

  end

  def destroy
    # @board = Board.find(params[:id])
    # find_board
    @board.destroy
    redirect_to root_path, notice: "已刪除"
  end

  

  private
  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    clean_params = params.require(:board).permit(:title)
  end

end