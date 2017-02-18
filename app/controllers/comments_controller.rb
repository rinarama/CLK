class CommentsController < ApplicationController
  def create
    @post = Post.find_by_id(comment_params[:post_id])
    @comment = @post.comments.new(user_id: current_user.id, content: comment_params[:content])
    
    if @comment.save
      redirect_to "/users/#{@post.user.id}"
    else
      redirect_to "/users/#{@post.user.id}"      
    end
  end
  
  def destroy
    @comment = Comment.find_by_id(params[:id])
    @comment.destroy
    
    redirect_to "/users/#{@comment.post.user.id}"
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
