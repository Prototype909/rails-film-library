class CommentsController < ApplicationController
    before_action :find_comment, :redirect_if_not_user, only: [:show, :edit, :update, :destroy]

    def index
        @comments = Comment.org
        if params[:film_id]
           @comments = Film.find(params[:film_id]).comments
        else
          @comments = Comment.all
        end
    end

    def new
    end

    def create
    end

    def show
        @film  = Film.find(parmas[:id])
    end

    def edit
    end

    def update
    end

    def destroy
    end



    private

    def comment_params
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end


#nest comments under fims!!!