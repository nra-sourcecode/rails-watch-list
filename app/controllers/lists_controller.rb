class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @movies = []
    id = params[:id]
    @list = List.find(id)
    @bookmarks = @list.bookmarks

    @bookmark = Bookmark.new

    @reviews = @list.reviews
    @review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    redirect_to list_path(@list)
  end

  def edit
    id = params[:id]
    @list = List.find(id)
  end

  def update
    id = params[:id]
    @list = List.find(id)

    @list.update(list_params)
    redirect_to list_path(@list)
  end

  private
  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
