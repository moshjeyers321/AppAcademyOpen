class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render JSON :index
  end

  def show
    @cat = Cat.find(params[:id])
    render JSON :show
  end
end
