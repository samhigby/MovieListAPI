module Api

  class MoviesController < ApplicationController
    def index
      @movies = Movie.all
      render json: @movies.to_json(include: :lists)
    end

    def show
      @movie = Movie.find_by('imdb_id = ?', params[:id])
      render json: @movie
    end

    def create
      if(Movie.exists?(imdb_id: params[:imdb_id]))
        @movie = Movie.find_by('imdb_id = ?', params[:imdb_id])
        @movie.update(movie_params)
        render json: @movie
      else
        @movie = Movie.create(movie_params)
        render json: @movie
      end
    end

    def update
      if(Movie.exists?(imdb_id: params[:imdb_id]))
        @movie = Movie.find_by('imdb_id = ?', params[:imdb_id])
        @movie.update(movie_params)
        render json: @movie
      else
        @movie = Movie.create(movie_params)
        render json: @movie.to_json
      end
     
    end

    def add_to_list
      if(Movie.exists?(imdb_id: params[:imdb_id]))
        @movie = Movie.find_by('imdb_id = ?', params[:imdb_id])
        @movie.update(movie_params)
      else
        @movie = Movie.new(movie_params)
        @movie.save
      end

      @list = List.find(params[:list_id])
      unless @list.movies.include?(@movie)
        @list.movies << @movie
        render json: @movie.to_json
      else
        
      end
        
    end

    def remove_from_list

      @movie = Movie.find(params[:movie_id])
      @list = List.find(params[:list_id])
      @list.movies.delete(@movie)

      render json: @movie

    end

    private

    def movie_params
      params.require(:movie).permit(:id, :title, :year, :imdb_id, :poster, :genre, :rating)
    end

  end





end