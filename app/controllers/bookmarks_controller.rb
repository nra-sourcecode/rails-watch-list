class BookmarksController < ApplicationController
  def new
    list_id = params[:list_id]
	  @list = List.find(list_id)

    @bookmark = Bookmark.new
  end

  def create

    bookmark_movie_params = bookmark_params()

    movie_id = bookmark_movie_params[:movie_id]
    @movie = Movie.find(movie_id)

    list_id = params[:list_id]
	  @list = List.find(list_id)

    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list_id = @bookmark[:list_id]
    @bookmark.destroy
    redirect_to list_path(@list_id)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
