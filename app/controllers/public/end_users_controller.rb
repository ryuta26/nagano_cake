class Public::EndUsersController < ApplicationController
	before_action :authenticate_end_user!

  def index
  end

  def show
  	@end_user = EndUser.find(params[:id])
  end

  def edit
  	@end_user = EndUser.find(params[:id])
  end

  def update
  	@end_user = EndUser.find(params[:id])
  	if @end_user.update(end_user_params)
  		redirect_to public_end_user_path(@end_user)
  	else
  		render :edit
  	end
  end

  def destroy
  	@end_user = EndUser.find(params[:id])
  	@end_user.destroy
  	redirect_to new_end_user_session_path
  end

  private
    def end_user_params
  	params.require(:end_user).permit(:last_name, :first_name, :last_kana, :first_kana, :postal_code, :domicile, :email)
  end

end
