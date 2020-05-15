class ItemsController < ApplicationController

  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  def buy
  end

  def complete_buy
  end

  def category
  end
end
