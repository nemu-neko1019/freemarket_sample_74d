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

  def step1user
    @user = User.new
    @user.build_sending_destination
  end

  def step2user

  end

  def complete_signup
  end

  def complete_logout
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :firstname,
      :familyname,
      :firstname_kana,
      :familyname_kana,
      :birthyear,
      :birthmonth,
      :birthday,
      sending_destination: [
        :firstname,
        :familyname,
        :firstname_kana,
        :familyname_kana,
        :prefecture_code,
        :municipal_district,
        :housenumber,
        :buildingname,
        :phonenumber,
        :id
      ]
    )
  end
  
end
