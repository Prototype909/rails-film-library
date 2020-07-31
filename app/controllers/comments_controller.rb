class CommentsController < ApplicationController
    before_action :find_comment, :redirect_if_not_user, only: [:show, :edit, :update, :destroy]

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
        @comment = @film.comments.create(comment_params)
        @comment.user.id = current_user.id
        if @comment.save
            redirect_to film_path(@film)
        else 
            redirect_to film_path(film)
        end
    end

    def show
        @film  = Film.find(parmas[:id])
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        @comment = Comment.find_by(id: params[:id])
        if @comment.user == current_user
            @film.comment.update(comment_params)
            redirect_to comment_path(@comment)
        else 
            render :edit 
        end

    end

    def destroy
        @comment = Comment.find_by(id: params[:id])

        if @comment.user.id == current_user.id 
            @comment.destroy 
        else 
            redirect_to films_path 
        end
    end



    private

    def comment_params
        params.require(:comment).permit(:body, :film_id)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end


