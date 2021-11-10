class Api::V1::HorrorMoviesController < ApplicationController

# GET /trips

    def index
        if logged_in?
            @horror_movies = current_user.horror_movies
            render json: HorrorMovieSerializer.new(@horror_movies, options)
        elsif 
            @horror_movies = HorrorMovie.all
            render json: HorrorMovieSerializer.new(@horror_movies, options)
        else
            render json: {
                error: "You must be logged in to see your movies."
            }
        end
    end

    #LATER: have to add a condition where if user isn't logged in, then display all the movies in the database with average score
    #also need to add route that isn't nested under user module 

    private

    # Used For compound documents with fast_jsonapi
    def options
        @options ||= { include: %i[reviews] }
    end


end
