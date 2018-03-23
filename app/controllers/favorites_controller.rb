class FavoritesController < ApplicationController
    before_action :user_is_logged_in, only: [:show]

  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_url, notice: "#{favorite.blog.user.name} liked te blog successfully"
  end

  def destroy
    favorite = current_user.favorites.find_by(blog_id: params[:blog_id]).destroy
    redirect_to blogs_url, notice: "#{favorite.blog.user.name} unliked te blog successfully"
  end
end
