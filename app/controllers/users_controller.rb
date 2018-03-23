class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end
  def show
    @user = User.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    @blog=Blog.where(user_id:@user)
  end
  def favorites_list
      @user = User.find_by(id:params[:id])
      @blog=@user.favorite_blogs.page(params[:page]).per(2)
    # @favorites_blogs = @user.favorites.distinct.pluck(:blog_id)
    # @connection = ActiveRecord::Base.connection
    # @results = @connection.exec_query('SELECT * FROM blogs INNER JOIN favorites ON favorites.blog_id = blogs.id INNER JOIN users ON users.id=favorites.user_id where favorites.user_id='+session[:user_id].to_s+'')
    #@blog=Blog.joins(:favorites).where(id:@favorites_blogs , user_id:session[:user_id]).uniq
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
