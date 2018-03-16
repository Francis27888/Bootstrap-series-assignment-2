class BlogsController < ApplicationController
  before_action :set_blog, only: [:show,:update,:destroy,:edit]
  before_action :user_is_logged_in, only: [:new,:edit,:show]
  def index
     @blogs=Blog.all
  end
  def index1
  
  end
  def confirm
    @blog = Blog.new(blog_params)
    render new_blog_path if @blog.invalid?
  end
  def new
    if params[:back]
      @blog=Blog.new(blog_params)
    else
       @blog=Blog.new
    end
  end
  def create
    @blog=Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "You have created new blog!"
    else
      render 'new'
    end
  end
  def show
    
  end
  def update
    @blog=Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "The blog updated successfully!"
    else
      render 'edit'
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path
  end
  
  private 
  def blog_params
    params.require(:blog).permit(:name,:email,:content)
  end
  
  def set_blog
    @blog =Blog.find(params[:id])
  end
  
end
