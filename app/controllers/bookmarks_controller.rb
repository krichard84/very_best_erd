class BookmarksController < ApplicationController
  def index
    @q = Bookmark.ransack(params[:q])
    @bookmarks = @q.result(:distinct => true).includes(:cuisine, :dishes, :venues, :neighborhood, :user).page(params[:page]).per(10)

    render("bookmarks/index.html.erb")
  end

  def show
    @bookmark = Bookmark.find(params[:id])

    render("bookmarks/show.html.erb")
  end

  def new
    @bookmark = Bookmark.new

    render("bookmarks/new.html.erb")
  end

  def create
    @bookmark = Bookmark.new

    @bookmark.dishes_id = params[:dishes_id]
    @bookmark.cuisine_id = params[:cuisine_id]
    @bookmark.venues_id = params[:venues_id]

    save_status = @bookmark.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bookmarks/new", "/create_bookmark"
        redirect_to("/bookmarks")
      else
        redirect_back(:fallback_location => "/", :notice => "Bookmark created successfully.")
      end
    else
      render("bookmarks/new.html.erb")
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])

    render("bookmarks/edit.html.erb")
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    @bookmark.dishes_id = params[:dishes_id]
    @bookmark.cuisine_id = params[:cuisine_id]
    @bookmark.venues_id = params[:venues_id]

    save_status = @bookmark.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bookmarks/#{@bookmark.id}/edit", "/update_bookmark"
        redirect_to("/bookmarks/#{@bookmark.id}", :notice => "Bookmark updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bookmark updated successfully.")
      end
    else
      render("bookmarks/edit.html.erb")
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    @bookmark.destroy

    if URI(request.referer).path == "/bookmarks/#{@bookmark.id}"
      redirect_to("/", :notice => "Bookmark deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bookmark deleted.")
    end
  end
end
