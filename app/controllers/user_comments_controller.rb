class UserCommentsController < ApplicationController
    def create
        @blog_post = BlogPost.find(params[:blog_post_id])
        @user_comment = @blog_post.user_comments.create(params[:user_comment])
        redirect_to blog_post_path(@blog_post)
    end

    def destroy
        @blog_post = BlogPost.find(params[:blog_post_id])
        @user_comment = @blog_post.user_comments.find(params[:id])
        @user_comment.destroy
        redirect_to blog_post_path(@blog_post)
    end

    def index
        @blog_post = BlogPost.find(params[:blog_post_id])
        @user_comments = @blog_post.user_comments
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @user_comments }
        end
    end
end
