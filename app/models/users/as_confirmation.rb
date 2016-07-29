module Users
  class AsConfirmation < ::User

    # Scopes
    #----------------------------------------------------------------------

    # NOOP

    # Macros
    #----------------------------------------------------------------------

    # NOOP

    # Associations
    #----------------------------------------------------------------------

    # NOOP

    # Validations
    #----------------------------------------------------------------------

    validates :full_name, presence: { message: ::Initializers::MESSAGES[:required] }
    validates :password, length: { minimum: 8 }, allow_nil: false

    # Methods
    #----------------------------------------------------------------------

    def confirm(params)
      update_attributes(
        params.merge(
          confirmed_at: Time.now,
          authentication_token: ::Modules::Generator.random_token
        )
      )
    end
  end
end
