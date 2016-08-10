class Party < ApplicationRecord

  # Scopes
  #----------------------------------------------------------------------

  scope :alphabetical, -> { order(:name) }

  # Macros
  #----------------------------------------------------------------------

  # NOOP

  # Associations
  #----------------------------------------------------------------------

  belongs_to :account
  has_many :guests, dependent: :destroy

  # Must come after has_many association
  accepts_nested_attributes_for :guests, reject_if: proc { |attributes| attributes[:first_name].blank? && attributes[:last_name].blank? }

  # Validations
  #----------------------------------------------------------------------

  validates :name, presence: true

  # Methods
  #----------------------------------------------------------------------

  def full_address
    "#{[address1, address2, city, state].reject(&:blank?).join(', ')} #{zip}"
  end

  def has_address?
    # !full_address.blank?
    !mailing_address.blank?
  end
end
