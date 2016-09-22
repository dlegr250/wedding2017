class AlcoholicBeverage < ApplicationRecord

  # Scopes
  #----------------------------------------------------------------------

  scope :alphabetical, -> { order(:name) }

  # Macros
  #----------------------------------------------------------------------

  # NOOP

  # Associations
  #----------------------------------------------------------------------

  has_many :guests, through: :drinkings
  has_many :drinkings

  # Validations
  #----------------------------------------------------------------------

  validates :name, presence: true

  # Methods
  #----------------------------------------------------------------------

  # NOOP
end
