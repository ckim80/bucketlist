class UsersController < ApplicationController

  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    @user = User.find(params[:id])
    @buckets = @user.buckets

    render("users/show.html.erb")
  end

  def likes
    @user = current_user
    @likes = @user.likes

  render("users/my_likes.html.erb")
  end

  def users_unlike
    @likes = Like.where(:user_id => current_user.id, :bucket_id => params[:id])
    @likes.destroy_all

    redirect_to("/users/"+current_user.id.to_s)
  end


end
