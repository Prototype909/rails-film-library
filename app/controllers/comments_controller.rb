class CommentsController < ApplicationController

    def new
    end

    def create
    end

    def show
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
