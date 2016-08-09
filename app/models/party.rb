class Party < ApplicationRecord

  # Scopes
  #----------------------------------------------------------------------

  scope :alphabetical, -> { order(:name) }

  # Macros
  #----------------------------------------------------------------------



  # Associations
  #----------------------------------------------------------------------

  belongs_to :account
  has_many :guests

  accepts_nested_attributes_for :guests

  # Validations
  #----------------------------------------------------------------------

  # NOOP

  # Methods
  #----------------------------------------------------------------------

  # NOOP
end
