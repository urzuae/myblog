class CommentsController < ApplicationController
  before_filter :find_comment, :only => [:show, :edit, :update, :destroy]
  before_filter :find_post
  
  def create
    
    @comment = @post.comments.build(params[:comment])
    
    flash[:notice] = if @comment.save
      'Comment was successfully created'
    else
      'Comment was not created'
    end
    redirect_to post_path(@post)
  end
  
  def update
    
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment was successfully updated'
      redirect_to post_comments_path(@post)
    else
      render 'edit'
    end
    
  end
  
  private
  
  def find_comment
    @comment = Comment.find(params[:id])
  end
  
  def find_post
    @post = Post.find(params[:post_id])
  end


end
