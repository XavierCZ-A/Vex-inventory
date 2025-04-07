class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.includes(:organization)
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      InvitationsMailer.invite(@invitation).deliver_later
      redirect_to invitations_path, notice: "Invitation sent successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def invitation_params
    params.expect(invitation: [ :email, :name ])
  end
end
