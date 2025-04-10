class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  layout "login_layout"

  def new
    token = params[:token]

    if token.blank?
      redirect_to home_path, alert: "El enlace de invitación no es válido"
      return
    end

    @invitation = Invitation.find_by_token_for(:invitation, token)

    if @invitation.nil?
      redirect_to home_path, alert: "El enlace de invitación no es válido o ha expirado."
    elsif !@invitation.pending?
      redirect_to home_path, alert: "Esta invitación ya ha sido #{ @invitation.status }."
    else
      @user = User.new()
      @organization = @invitation.organization
      session[:invitation_token] = token
    end
  end

  def create
    token = session[:invitation_token]

    @invitation = Invitation.find_by_token_for(:invitation, token)

    if @invitation.nil? || !@invitation.pending?
      redirect_to home_path, alert: "La invitación no es válida o ha expirado."
      return
    end

    @user = User.new(user_params)
    @user.organization = @invitation.organization

    if @user.save
      @invitation.update(status: :accepted, recipient: @user,)

      session.delete(:invitation_token)

      start_new_session_for(@user)
      redirect_to products_path, notice: "¡Bienvenido! Tu cuenta ha sido creada y la invitación aceptada."
    else
      @organization = @invitation.organization
      flash.now[:alert] = "Error al crear el usuario."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.expect(user: [ :name, :last_name, :email_address, :password, :role ])
  end
end
