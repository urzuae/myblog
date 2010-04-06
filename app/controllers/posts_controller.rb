class PostsController < ApplicationController
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]
  before_filter :find_categories, :only => [:new, :edit, :create, :update]
  
  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
    @category = Category.find(@post.category_id)
  end

  def new
    @post = Post.new
    if @categories.empty?
      flash[:notice] = "Create a cetegory first"
      redirect_to new_category_path
    end
  end

  def edit
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def update

    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def find_post
    @post = Post.find(params[:id])
  end
  
  def find_categories
    @categories = Category.find(:all)
  end
  
end
