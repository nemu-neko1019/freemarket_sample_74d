class UsersController < ApplicationController

  def new
  end

  def destroy
  end

  def edit
    render "users/#{params[:name]}", locals: {user: current_user }
  end

  def update
  end

  def show
  end

end
