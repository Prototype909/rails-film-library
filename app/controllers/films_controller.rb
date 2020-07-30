class FilmsController < ApplicationController
    #before_action :find_film, :redirect_if_not_user, only: [:show, :edit, :update, :destroy]
   

    def index
        @films = Film.all
        
    end

    def new
        @film = Film.new
        @genres = Genre.all
    end

    def create
       
        #@film = Film.create(film_params)
        # @film = Film.new(film_params)
        @film = current_user.films.build(film_params)
        #@film.user_id = current_user.id
        if @film.valid?
            @film.save
            redirect_to film_path(@film)
        else
            @film = Film.find_by_id(params[:film_id]) if params[:film_id]
            render :new
        end
    end

    def edit
        find_film
    end

    def update
        find_film
        if @film.user == current_user
            @film.update(film_params)
            redirect_to film_path(@film)
        else
            render :edit
        end
    end

    def show
    end

    def destroy
        @film.destroy
        redirect_to film_path
    end

    private

    def film_params
        params.require(:film).permit(:title, :director, :year, :description, :genre_id, :user_id)
    end

    def redirect_if_not_user
        if @film.user != current_user
            redirect_to user_path(current_user), alert: "You Do Not Have Permission To Edit This Film!"
        end
    end

    def find_film
        @film = Film.find(params[:id])
    end
end
