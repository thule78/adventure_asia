class UsersController < ApplicationController
  #following http://railscasts.com/episodes/393-guest-user-record
  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
