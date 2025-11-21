class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @movies = []
    id = params[:id]
    @list = List.find(id)
    @bookmarks = @list.bookmarks
    # @bookmarks.each do |bookmark|
    #   @movie_id = bookmark.movie_id
    #   @movie = Movie.find(@movie_id)
    # end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    redirect_to list_path(@list)
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
