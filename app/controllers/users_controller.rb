class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  def index
    if can? :manage, User
      @users = User.order(created_at: :desc)
    else
      authorize! :manage, User
    end
  end

  def show    
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "User was sucessfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit({role_ids: []})
    end

end