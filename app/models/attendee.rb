class Attendee < ApplicationRecord

  # Scopes
  #----------------------------------------------------------------------

  scope :alphabetical, -> { order(:full_name) }
  scope :party, -> (value) { where(party: value) }
  scope :bride, -> { where(party: "bride") }
  scope :groom, -> { where(party: "groom") }
  scope :both, -> { where(party: "both") }

  # Macros
  #----------------------------------------------------------------------

  delegate :value, to: :salutation, prefix: true, allow_nil: true

  # Associations
  #----------------------------------------------------------------------

  belongs_to :salutation

  # Validations
  #----------------------------------------------------------------------

  validates :full_name, presence: true, uniqueness: true

  # Methods
  #----------------------------------------------------------------------

  def salutation_and_full_name
    "#{salutation_value} #{full_name}"
  end

  def bride?
    party.to_s.downcase == "bride"
  end

  def groom?
    party.to_s.downcase == "groom"
  end

  def both?
    party.to_s.downcase == "both"
  end

  def full_address
    "#{[address1, address2, city, state].reject(&:blank?).join(', ')} #{zip}"
  end
end
