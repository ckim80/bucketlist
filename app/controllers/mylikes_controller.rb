class MylikesController < ApplicationController

  def index
    @likes = current_user.likes

    render("my_likes/index.html.erb")
  end

end
