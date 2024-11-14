class ListsController < ApplicationController
  def index
    @lists = List.all
  end
  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new(params[:attributes])
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path(), status: :see_other
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def list_params
    params.require(:list).permit(:name)
  end
end