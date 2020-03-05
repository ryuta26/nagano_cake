class Public::ItemsController < ApplicationController
	def index
		if params[:genre_id]
	      @genre = Genre.find(params[:genre_id])
	      @items = @genre.items.all
	    else
	      @items = Item.all

		end
		@url = request.fullpath

	end
end
