Rails.application.routes.draw do
  devise_for :users, controllers: {
          sessions: 'users/sessions'
        }

  # Routes for the User resource:

  root "buckets#landing"

  # CREATE
  get "/comments/new", :controller => "comments", :action => "new"
  post "/create_comment", :controller => "comments", :action => "create"

  # READ
  get "/comments", :controller => "comments", :action => "index"
  get "/comments/:id", :controller => "comments", :action => "show"

  # UPDATE
  get "/comments/:id/edit", :controller => "comments", :action => "edit"
  post "/update_comment/:id", :controller => "comments", :action => "update"

  # DELETE
  get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  #------------------------------

  # Routes for the Like resource:
  # CREATE
  get "/likes/new", :controller => "likes", :action => "new"
  post "/create_like", :controller => "likes", :action => "create"

  # READ
  get "/likes", :controller => "likes", :action => "index"
  get "/likes/:id", :controller => "likes", :action => "show"

  # UPDATE
  get "/likes/:id/edit", :controller => "likes", :action => "edit"
  post "/update_like/:id", :controller => "likes", :action => "update"

  # DELETE
  get "/delete_like/:id", :controller => "likes", :action => "destroy"
  #------------------------------

  # Routes for the Bucket resource:
  # CREATE
  get "/buckets/new", :controller => "buckets", :action => "new"
  post "/create_bucket", :controller => "buckets", :action => "create"

  # READ
  get "/", :controller => "buckets", :action => "landing"
  get "/buckets", :controller => "buckets", :action => "index"
  get "/buckets/:id", :controller => "buckets", :action => "show"

  # UPDATE
  get "/buckets/:id/edit", :controller => "buckets", :action => "edit"
  post "/update_bucket/:id", :controller => "buckets", :action => "update"

  # DELETE
  get "/delete_bucket/:id", :controller => "buckets", :action => "destroy"
  #------------------------------


  # Read
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

  # likes
  get "/users_like/:id", :controller => "users", :action => "users_like"

  #users_unlike
  get "/users_unlike/:id", :controller => "users", :action => "users_unlike"

  #my_likes
  get "/my_likes", :controller => "users", :action => "likes"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
