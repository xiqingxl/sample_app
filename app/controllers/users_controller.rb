class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :currect_user, only:[:edit, :update]
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

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Success update"
      sign_in(@user)
      redirect_to @user
    else
      render 'edit'
    end

  end


  def show
    @user = User.find(params[:id])
  end

  private

  def signed_in_user
    redirect_to signin_path, notice: "Please sign in." unless signed_in?
  end

  def currect_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless cc_user?(@user)
  end
end
