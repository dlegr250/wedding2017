#======================================================================
# Abstracts the encryption key into a reusable module.
# See: https://mikecoutermarsh.com/rails-keeping-your-users-data-safe
#======================================================================
module Modules
  module Encryption
    extend ActiveSupport::Concern

    # Class level
    #----------------------------------------------------------------------

    included do
      def self.encryption_key
        if Rails.env.production?
          raise "Must set encryption key ENV variable!" unless ENV["ENCRYPTION_KEY"]
          ENV["ENCRYPTION_KEY"]
        else
          ENV["ENCRYPTION_KEY"] ? ENV["ENCRYPTION_KEY"] : "test_key-Y6VRPzTArKO2IE5bGANIfJ4DbyuXABiRdZbPFFO6oHbn77ST-w8mA"
        end
      end
    end

    # Instance level
    #----------------------------------------------------------------------

    # NOOP
  end
end
