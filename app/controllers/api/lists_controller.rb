module Api

  class ListsController < ApplicationController
    def index
      @lists = List.all
      render json: @lists
    end

    def create
      @list = List.new(list_params)

      if @list.save
        render json: @list

      else
        render json: @list.errors
      end
    end

    private

    def list_params
      params.require(:list).permit(:name)
    end

  end





end