class Guest < ApplicationRecord

  # Scopes
  #----------------------------------------------------------------------

  scope :alphabetical, -> { order(:full_name) }

  # Macros
  #----------------------------------------------------------------------

  delegate :name, to: :party, prefix: true, allow_nil: true

  after_save :create_party_if_none
  after_save :remove_old_party_if_empty

  # Associations
  #----------------------------------------------------------------------

  belongs_to :account
  belongs_to :party

  has_many :alcoholic_beverages, through: :drinkings
  has_many :drinkings

  # Validations
  #----------------------------------------------------------------------

  validates :full_name, presence: true

  # Methods
  #----------------------------------------------------------------------

  def alcoholic_beverage_names
    @alcoholic_beverage_names ||= generate_alcoholic_beverage_names
  end

  private

  def generate_alcoholic_beverage_names
    alcoholic_beverages.pluck(:name).map { |d| d.capitalize }.join(", ")
  end

  # Ensure Guest is always associated to a Party
  def create_party_if_none
    if party.blank?
      ActiveRecord::Base.transaction do
        automatic_party = account.parties.create(name: "#{full_name} Party")
        update_attribute(:party_id, automatic_party.id)
      end
    end
  end

  # If Guest was in a Party and that Party is now empty, remove it
  def remove_old_party_if_empty
    if party_id_changed? && party_id_was.present?
      party = Party.find(party_id_was)
      party.delete if party.guests.count.zero?
    end
  end
end
