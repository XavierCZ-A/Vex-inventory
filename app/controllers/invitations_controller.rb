class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
    authorize @invitations
  end

  def new
    @invitation = Invitation.new
    authorize @invitation
  end

  def create
    @invitation = Invitation.new(invitation_params)
    authorize @invitation
    if @invitation.save
      InvitationsMailer.invite(@invitation).deliver_later
      redirect_to invitations_path, notice: "Invitation sent successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def resend
    @invitation = Invitation.find(params[:id])
    InvitationsMailer.invite(@invitation).deliver_later
    redirect_to invitations_path, notice: "Invitation resent successfully."
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :name)
  end
end
