class BucketsController < ApplicationController
  def landing
    render("buckets/landing.html.erb")
  end

  def index
    @buckets = Bucket.all

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
    @bucket.caption = params[:caption]
    @bucket.deadline = params[:deadline]
    @bucket.image2 = params[:image2]
    @bucket.location = params[:location]
    @bucket.price_range = params[:price_range]

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
    @bucket.image = params[:image]
    @bucket.caption = params[:caption]
    @bucket.deadline = params[:deadline]
    @bucket.image2 = params[:image2]
    @bucket.location = params[:location]
    @bucket.price_range = params[:price_range]

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

    if URI(request.referer).path == "/buckets/#{@bucket.id}"
      redirect_to("/", :notice => "Bucket deleted.")
    else
      redirect_to(:back, :notice => "Bucket deleted.")
    end
  end
end
