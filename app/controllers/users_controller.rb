class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  layout "login_layout"

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to products_path, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.expect(user: [ :name, :last_name, :email_address, :password ])
  end
end
