class Party < ApplicationRecord

  # Scopes
  #----------------------------------------------------------------------

  # NOOP

  # Macros
  #----------------------------------------------------------------------

  # NOOP

  # Associations
  #----------------------------------------------------------------------

  belongs_to :account
  has_many :guests

  # Validations
  #----------------------------------------------------------------------

  # NOOP

  # Methods
  #----------------------------------------------------------------------

  # NOOP
end
