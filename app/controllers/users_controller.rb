class UsersController < ApplicationController

  def new
  end

  def create
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

  def address
  end

  def complete_signup
  end

  def complete_logout
  end
  
end
