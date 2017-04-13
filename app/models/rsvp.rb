#======================================================================
# Form object for RSVP functionality
#======================================================================
class Rsvp
  include ActiveModel::Model

  # Scopes
  #----------------------------------------------------------------------

  # NOOP

  # Macros
  #----------------------------------------------------------------------

  attr_accessor :code
  attr_accessor :party

  # Associations
  #----------------------------------------------------------------------

  # NOOP

  # Validations
  #----------------------------------------------------------------------

  validates :code, presence: { message: "Please enter your RSVP Code" }
  validate :code_is_valid

  # Methods
  #----------------------------------------------------------------------

  def party
    @party ||= get_party
  end

  private

  def get_party
    # Party.find_by(rsvp_code: code)
    Party.where("UPPER(parties.rsvp_code) = ?", code.to_s.upcase).first
  end

  def code_is_valid
    return if code.blank?

    if party
      true
    else
      errors.add :code, "RSVP Code is invalid, please check your Invitation"
    end
  end
end
