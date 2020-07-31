class CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :edit, :update, :destroy]

    def index
        @user = User.find_by(id: params[:user_id])
        if @user 
            @comments = @user.comments
        else 
            @comments = Comment.all
        end 
    end

    def new
        @comment = Comment.new(film_id: params[:film_id])
    end

    def create
        @film = Film.find(params[:film_id])
        @comment = @film.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to film_path(@film)
        else 
            redirect_to films_path(film)
        end
    end

    def show
        @comment  = Comment.find(params[:id])
    end

    def edit
        find_comment
    end

    def update
        find_comment
        if @comment.user == current_user
            @comment.update(comment_params)
            redirect_to film_path(@comment.film_id)
        else 
            render :edit 
        end

    end

    def destroy
        find_comment
        if @comment.user == current_user
            @comment.destroy 
            redirect_to films_path(@comment)

        else
            redirect_to films_path 
        end
    end



    private

    def comment_params
        params.require(:comment).permit(:body, :film_id, user_attributes: [:username])
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end


