module Api

  class ListsController < ApplicationController
    def index
      @lists = List.all
      render json: @lists.to_json(include: :movies)
    end

    def create
      @list = List.new(list_params)

      if @list.save
        render json: @list

      else
        render json: @list.errors
      end
    end

    def update
      @list = List.find(params[:id])
      if @list.update(list_params)
        @list.movies = []
        if params.has_key?(:movies) 
          params[:movies].each do |movie|
              @movie = Movie.find_by(imdb_id: movie[:imdb_id])
              if @movie.nil?
                movie.permit!
                @movie = Movie.new(movie)
              end
              @list.movies << @movie
          end
        end
        render json: @list.to_json(include: :movies)
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end

    private

    def list_params
      params.require(:list).permit(:name, movies: [])
    end

  end

end