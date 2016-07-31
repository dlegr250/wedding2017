class User < ApplicationRecord

  # Scopes
  #----------------------------------------------------------------------

  scope :alphabetical, -> { order(:full_name) }
  scope :confirmed, -> { where.not(confirmed_at: nil) }
  scope :unconfirmed, -> { where(confirmed_at: nil) }

  # Macros
  #----------------------------------------------------------------------

  has_secure_password

  # Associations
  #----------------------------------------------------------------------

  belongs_to :account

  # Validations
  #----------------------------------------------------------------------

  validates :account, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /@/, message: "is invalid" }
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

  # Methods
  #----------------------------------------------------------------------

  def update_password(params)
    if params[:password].blank?
      errors.add :password, "can't be blank"
      return false
    elsif params[:password] != params[:password_confirmation]
      errors.add :password_confirmation, "doesn't match password"
      return false
    else
      update_attributes(params)
    end
  end

  def confirmed?
    confirmed_at.present?
  end

  def password_reset_token_expired?
    password_reset_token_sent_at < 2.hours.ago
  end
end
