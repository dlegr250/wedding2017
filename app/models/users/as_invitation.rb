module Users
  class AsInvitation < ::User

    # Scopes
    #----------------------------------------------------------------------

    # NOOP

    # Macros
    #----------------------------------------------------------------------

    after_create { Mailer.invitation_email(self).deliver_later }

    # Associations
    #----------------------------------------------------------------------

    # NOOP

    # Validations
    #----------------------------------------------------------------------

    validates :confirmation_token, presence: true

    # Methods
    #----------------------------------------------------------------------

    def save
      self.confirmation_token = ::Modules::Generator.random_token if confirmation_token.blank?
      self.password = self.password_confirmation = ::Modules::Generator.random_token
      super
    end
  end
end
