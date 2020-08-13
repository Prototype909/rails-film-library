class FilmsController < ApplicationController
    before_action :find_film, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_user, only: [:edit, :update, :destroy]
   

    def index
        @films = Film.alpha
        
    end

    def favorites
        @films = Film.favorite_films
        render:index
    end

    def new
        @film = Film.new
    end

    def create 
        @film = current_user.films.build(film_params)
        if @film.valid?
            @film.save
            redirect_to film_path(@film)
        else
            render :new
        end
    end

    def edit
        
    end

    def update        
        if @film.user == current_user
            @film.update(film_params)
            redirect_to film_path(@film)
        else
            render :edit
        end
    end

    def show
        find_film        
    end

    def destroy        
        if @film.user == current_user
        @film.destroy
        redirect_to films_path
        end
    end

    

    private

    def film_params
        params.require(:film).permit(:title, :director, :year, :description, :genre_id, :user_id)
    end

    def redirect_if_not_user
        if @film.user != current_user
            redirect_to user_path(current_user), alert: "Sorry, You Do Not Have Permission To Edit This Film!"
        end
    end

    def find_film
        @film = Film.find(params[:id])
    end
end
