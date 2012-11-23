class BlogPostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :get_blog_post, only: [:edit, :update, :destroy]
  before_filter :check_authorisation, only: [:edit, :update, :destroy]

  def get_blog_post
    @blog_post = BlogPost.find(params[:id]) 
  end

  def check_authorisation
    unless @blog_post.user_id == current_user.id
      redirect_to blog_posts_path, notice: 'You are not authorized to modify that resource'
    end
  end

  # GET /blog_posts
  # GET /blog_posts.json
  def index
    @blog_posts = BlogPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blog_posts }
    end
  end

  # GET /blog_posts/1
  # GET /blog_posts/1.json
  def show
    @blog_post = BlogPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog_post }
    end
  end

  # GET /blog_posts/new
  # GET /blog_posts/new.json
  def new
    @blog_post = BlogPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog_post }
    end
  end

  # GET /blog_posts/1/edit
  def edit
    
  end

  # POST /blog_posts
  # POST /blog_posts.json
  def create
    @blog_post = BlogPost.new(params[:blog_post])
    @blog_post.user_id = current_user.id

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to @blog_post, notice: 'Blog post was successfully created.' }
        format.json { render json: @blog_post, status: :created, location: @blog_post }
      else
        format.html { render action: "new" }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blog_posts/1
  # PUT /blog_posts/1.json
  def update

    respond_to do |format|
      if @blog_post.update_attributes(params[:blog_post])
        format.html { redirect_to @blog_post, notice: 'Blog post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_posts/1
  # DELETE /blog_posts/1.json
  def destroy
    @blog_post.destroy

    respond_to do |format|
      format.html { redirect_to blog_posts_url }
      format.json { head :no_content }
    end
  end
end
