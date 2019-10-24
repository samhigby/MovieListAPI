module Api

  class MoviesController < ApplicationController
    def index
      @movies = Movie.all
      render json: @movies.to_json(include: :lists)
    end

    def create
      if(Movie.exists?(imdb_id: params[:imdb_id]))
        @movie = Movie.where('imdb_id = ?', params[:imdb_id])
        @movie.update(movie_params)
        render json: @movie
      else
        @movie = Movie.new(movie_params)
        save_render_movie(@movie)
      end
    end

    def update
      if @movie.update(movie_params)
        render json: @movie
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
    end

    private

    def movie_params
      params.require(:movie).permit(:title, :year, :imdb_id, :poster, :genre, :rating)
    end

    def save_render_movie(movie)
      if movie.save
        render json: movie
      else
        render json: movie.errors
      end
    end

  end





end