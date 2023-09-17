class PostsController < ApplicationController
    skip_before_action :authenticate_user!, :only => [:index, :show]
    
    def index
        @post = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.create(post_params)
        redirect_to @post#index
    end

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end

end