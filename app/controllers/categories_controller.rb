class CategoriesController < ApplicationController
  before_filter :find_category, :only => [:show, :edit, :update, :destroy]
  before_filter :require_authentication, :except => [:index, :show]
  
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      flash[:notice] = 'Category was successfully created.'
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def update
    
    if @category.update_attributes(params[:category])
      flash[:notice] = 'Category was successfully updated.'
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end
  
  private
  
  def find_category
    @category = Category.find(params[:id])
  end
end
