class Guest < ApplicationRecord

  # Scopes
  #----------------------------------------------------------------------

  scope :alphabetical, -> { order(:first_name, :last_name) }

  # Macros
  #----------------------------------------------------------------------

  delegate :name, to: :party, prefix: true, allow_nil: true

  # Associations
  #----------------------------------------------------------------------

  belongs_to :account
  belongs_to :party

  has_many :alcoholic_beverages, through: :drinkings
  has_many :drinkings

  # Validations
  #----------------------------------------------------------------------

  validates :first_name, :last_name, presence: true

  # Methods
  #----------------------------------------------------------------------

  def initials
    "#{first_name.first}#{last_name.first}".upcase
  end

  def first_and_last_name
    [first_name, last_name].join(" ")
  end

  def last_and_first_name
    [last_name, first_name].join(", ")
  end

  def alcoholic_beverage_names
    @alcoholic_beverage_names ||= generate_alcoholic_beverage_names
  end

  private

  def generate_alcoholic_beverage_names
    alcoholic_beverages.pluck(:name).map { |d| d.capitalize }.join(", ")
  end
end
