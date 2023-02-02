class PostsController < ApplicationController
 
    before_action :user_signed_in?
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = 'Post successfully created'
            redirect_to posts_path
        else
            flash[:error] = 'Something went wrong'
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @article = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
          redirect_to @post, notice: "Succesfully Updated"
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        @post = Post.find(params[:id])
        @post.destroy
    
        redirect_to root_path, status: :see_other
      end

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end



end
