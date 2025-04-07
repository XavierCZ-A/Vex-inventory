class InvitationsMailer < ApplicationMailer
  def invite(invitation)
    @invitation = invitation
    mail(to: invitation.email, subject: "Invitation to join #{invitation.organization.name}")
  end
end
