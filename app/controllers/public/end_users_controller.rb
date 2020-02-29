class Public::EndUsersController < ApplicationController
	before_action :authenticate_end_user!
  def index
  end

  def show
  	@end_user = EndUser.find(params[:id])
  end

  def edit
  end
end
