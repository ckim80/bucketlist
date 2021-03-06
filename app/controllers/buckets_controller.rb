class BucketsController < ApplicationController
  def landing
    render("buckets/landing.html.erb")
  end

  def index
    @q = Bucket.ransack(params[:q])
    @buckets = @q.result(distinct: true).order("created_at desc")

    # Bucket.all.order("buckets.created_at desc")

    render("buckets/index.html.erb")
  end

  def show
    @bucket = Bucket.find(params[:id])

    render("buckets/show.html.erb")
  end

  def new
    @bucket = Bucket.new

    render("buckets/new.html.erb")
  end

  def create
    @bucket = Bucket.new

    @bucket.user_id = params[:user_id]
    @bucket.user_id = current_user.id
    @bucket.image = params[:image]
    @bucket.category = params[:category]
    @bucket.caption = params[:caption]
    @bucket.deadline = Chronic.parse params[:deadline]
    @bucket.body = params[:body]
    @bucket.location = params[:location]
    @bucket.price_range = params[:price_range]
    @bucket.done = params[:done]


    save_status = @bucket.save

    if save_status == true
      redirect_to("/buckets/#{@bucket.id}", :notice => "Bucket created successfully.")
    else
      render("buckets/new.html.erb")
    end
  end

  def edit
    @bucket = Bucket.find(params[:id])

    render("buckets/edit.html.erb")
  end

  def update
    @bucket = Bucket.find(params[:id])

    @bucket.user_id = params[:user_id]
    @bucket.user_id = current_user.id
    @bucket.image = params[:image]
    @bucket.category = params[:category]
    @bucket.caption = params[:caption]
    @bucket.deadline = Chronic.parse params[:deadline]
    @bucket.body = params[:body]
    @bucket.location = params[:location]
    @bucket.price_range = params[:price_range]
    @bucket.done = params[:done]

    save_status = @bucket.save

    if save_status == true
      redirect_to("/buckets/#{@bucket.id}", :notice => "Bucket updated successfully.")
    else
      render("buckets/edit.html.erb")
    end
  end

  def destroy
    @bucket = Bucket.find(params[:id])

    @bucket.destroy

    redirect_to("/buckets", :notice => "Bucket deleted.")
  end
end
