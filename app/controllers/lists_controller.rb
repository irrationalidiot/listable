class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(params[:list])
    if list.save
      flash[:notice] = "List added"
      redirect_to lists_url
    else
      render :new
    end
  end
end
