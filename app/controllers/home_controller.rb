class HomeController < ApplicationController
  before_filter :user_authenticate!, except: [:index]
  def index
  	@user_details = UserDetail.all
  end

  def new
  	@user_detail = UserDetail.new
  end

  def create
  	@user_detail = UserDetail.new(user_detail_params)
  	if @user_detail.save
  		redirect_to home_index_path
  	else
  		redirect_to home_new_path
  	end
  end

  def edit
    @user_detail = UserDetail.find_by(id: params[:user_detail_id])
  end

  def update
    @user_detail = UserDetail.find_by(id: params[:user_detail][:id])
    if @user_detail.update(user_detail_params)
      redirect_to home_index_path
    else
      redirect_to home_edit_path
    end
  end

  def show
    @user_detail = UserDetail.find_by(id: params[:user_detail_id])
  end

  private

  def user_detail_params
  	params.require(:user_detail).permit(:name, :address)
  end
end
