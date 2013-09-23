  class UsersController < ApplicationController

  def index
    @user=User.new
  end

  def show
  @user=User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to @user, notice: 'User is created.' #redirecting to usrs/show.html
    else
      render action: 'index'                        #redirecting to users/index.html
    end
  end

  def update
    @user = User.find(params[:id])
    @user.email =params[:user][:email]
     @user.update_attributes(user_params)
    redirect_to @user, notice: 'User Info is updated.' #redirecting to usrs/show.html    
  end

  def edit
    @user=User.find(params[:id])
  end

  def destroy
    @user=User.find(params[:id])
    if @user
    @user.destroy
    end
    redirect_to users_url
  end

  def login
    p params[:user_name]
    @user=User.new
    @user= @user.authenticate_safely(params[:user_name],params[:password])
    if @user
      redirect_to @user       #redirecting to usrs/show.html
    elsif  params[:user_name].eql?("super") & (params[:password].eql?("admin"))      
      return @users = User.all      
    else
      redirect_to users_url, notice: 'Invalid email or password.'                   #redirecting to users/index.html
    end
  end

  private

  def user_params
      params.require(:user).permit(:email, :password, :user_name)
  end
end
