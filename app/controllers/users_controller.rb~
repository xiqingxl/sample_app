class UsersController < ApplicationController

  def index
    @user = User.all   
  end
  
  def new
    @user = User.new
  end
  
  def edit 
    @user = User.find(params[:id])
  
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Success Create ! welcome to the Sample App"
      redirect_to @user
    else
     render 'new'
    end
  end   
   
  def show
    @user = User.find(params[:id])
    @test = User.find_by_remember_token(cookies[:remember_token])
  end
end
