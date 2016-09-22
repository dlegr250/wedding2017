class Party < ApplicationRecord

  # Scopes
  #----------------------------------------------------------------------

  scope :alphabetical, -> { order(:name) }
  scope :missing_mailing_address, -> { where(mailing_address: [nil, ""]) }
  scope :save_the_date_not_sent, -> { where(save_the_date_sent: [false, nil]) }
  scope :invitation_not_sent, -> { where(invitation_sent: [false, nil]) }

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

  def has_address?
    !mailing_address.blank?
  end

  # Cleanup before saving
  def mailing_address=(val)
    self[:mailing_address] = val.strip
  end
end
