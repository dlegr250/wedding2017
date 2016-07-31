class Guest < ApplicationRecord

  # Scopes
  #----------------------------------------------------------------------

  scope :alphabetical, -> { order(:full_name) }

  # Macros
  #----------------------------------------------------------------------

  delegate :name, to: :party, prefix: true, allow_nil: true

  # Associations
  #----------------------------------------------------------------------

  belongs_to :party

  # Validations
  #----------------------------------------------------------------------

  validates :full_name, presence: true

  # Methods
  #----------------------------------------------------------------------

  # NOOP
end
