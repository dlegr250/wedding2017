module Modules
  module Uuid
    extend ActiveSupport::Concern

    # Class level
    #----------------------------------------------------------------------

    included do
      scope :blank_uuids, -> { where(uuid: [nil, ""]) }

      # Does not use Generator.uuid to avoid an external dependency
      before_validation { self.uuid = SecureRandom.uuid if uuid.blank? }

      validates :uuid, presence: true
    end

    # Instance level
    #----------------------------------------------------------------------

    # NOOP
  end
end
