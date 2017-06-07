class MylikesController < ApplicationController

  def index
    @likes = current_user.likes.order(caption: :desc)

    render("my_likes/index.html.erb")
  end

end
