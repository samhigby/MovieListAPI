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

      #unsafe
      puts params[:name]
      @list = List.find(params[:id])
      if @list.update(list_params)
          @list.movies = []
            params[:movies].each do |m|
                
              @movie = Movie.find_by(imdb_id: m[:imdb_id])
              puts 'found movie'
              puts @movie
              puts 'done found movie'
              if @movie.nil?
                puts 'movie is nil'
                puts m
                # puts m.permit!
                @movie = Movie.new(m)
                puts @movie
                puts '^movie created'
              end
              @list.movies << @movie
          end
        render json: @list.to_json(include: :movies)
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end

    private

    def list_params
      params.require(:list).permit(:name);
     # params.permit(:id, :name, { movies: [:id, :title, :year, :poster, :genre, :rating, :imdb_id]})
      # params.require(:list).permit(:id, :name, movies: [:id, :title, :year, :poster, :genre, :rating, :imdb_id] )
    end


  end

end