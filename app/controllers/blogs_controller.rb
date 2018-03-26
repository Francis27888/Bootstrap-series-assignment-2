class BlogsController < ApplicationController
  before_action :set_blog, only: [:show,:update,:destroy,:edit]
  before_action :user_is_logged_in, only: [:new,:edit,:show,:index]
  def index
    # @blogs=Blog.all.page(params[:page]).per(3)
     @blogs=Blog.joins("INNER JOIN users ON users.id = Blogs.user_id").select("Blogs.id,Blogs.user_id,users.name,users.email,Blogs.content").page(params[:page]).per(3)
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
    # @blog=current_user.user.find_by(id: session[:user_id])
    # @user = User.find(params[:session][:user_id])
    # user = User.find_by(email: params[:session][:email].downcase)
    @blog=Blog.new(blog_params)
    # @blog.user_id=current_user
    if @blog.save!
      redirect_to blogs_path, notice: "You have created new blog!"
    else
      render 'new'
    end
  end
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
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
    # params.require(:blog).permit(:name,:email,:content).merge(user: current_user)
    params.require(:blog).permit(:content).merge(user: current_user)
  end
  
  def set_blog
    @blog =Blog.find(params[:id])
  end
  
end
