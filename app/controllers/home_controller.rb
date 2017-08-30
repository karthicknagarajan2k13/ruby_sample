class HomeController < ApplicationController
  def index
  	@user_detail = UserDetail.all
  end
end
