class SignupController < ApplicationController

  def step1
    @user = User.new
    @user.build_sending_destination
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:firstname] = user_params[:firstname]
    session[:familyname] = user_params[:familyname]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:familyname_kana] = user_params[:familyname_kana]
    session[:birthyear] = user_params[:birthyear]
    session[:birthmonth] = user_params[:birthmonth]
    session[:birthday] = user_params[:birthday]
    @user = User.new(user_params)
    render "/signup/step1" unless @user.valid?
    @user.build_sending_destination
  end

  def create
    @user = User.new(nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      firstname: session[:firstname],
      familyname: session[:familyname],
      firstname_kana: session[:firstname_kana],
      familyname_kana: session[:familyname_kana],
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday])
    @user.build_sending_destination(user_params[:sending_destination_attributes])
    if @user.save
      session[:id] = @user.id
      redirect_to complete_signup_signup_index_path
    else
      render "/signup/step2"
    end
  end

  def complete_signup
    sign_in User.find(session[:id]) unless user_signed_in?
  end
  
  def logout
    reset_session
    redirect_to complete_logout_signup_index_path
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
      sending_destination_attributes: [
        :postalcode,
        :prefecture_id,
        :municipal_district,
        :housenumber,
        :buildingname,
        :phonenumber,
        :ids
      ]
    )
  end
end
