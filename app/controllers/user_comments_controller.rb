class UserCommentsController < ApplicationController
    before_filter :get_blog_post
    before_filter :check_authorisation, only: :destroy

    def get_blog_post
        @blog_post = BlogPost.find(params[:blog_post_id])
    end

    def check_authorisation
        unless @blog_post.user_id == current_user.id
          redirect_to blog_post_path(@blog_post), notice: 'You can only delete comments on your own blog'
        end
    end

    def create
        @user_comment = @blog_post.user_comments.create(params[:user_comment])
        redirect_to blog_post_path(@blog_post)
    end

    def destroy
        @user_comment = @blog_post.user_comments.find(params[:id])
        @user_comment.destroy
        redirect_to blog_post_path(@blog_post)
    end

    def index
        @user_comments = @blog_post.user_comments
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @user_comments }
        end
    end
end
