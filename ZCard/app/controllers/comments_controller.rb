class CommentsController < ApplicationController
  before_action :session_required
  
  # before_action find_post, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    
    if @comment.save
      redirect_to @post, notice: '新增成功'
    else
      render
       'posts/show'
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    # comment.destroy
    # debugger
    comment.update(deleted_at: Time.now)
    redirect_to comment.post, notice: '留言已刪除'
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end