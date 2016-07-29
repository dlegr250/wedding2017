#======================================================================
# Generates random/unique strings/tokens/IDs
# See: http://ruby-doc.org/stdlib-2.0.0/libdoc/securerandom/rdoc/SecureRandom.html
# See: http://ruby.railstutorial.org/chapters/sign-in-sign-out#sec-signin_success
#======================================================================
module Modules
  module Generator
    require "securerandom"

    # General-purpose encryption using SHA1 instead of bcrypt.
    # Faster but LESS SECURE than bcrypt; do not use for sensitive data.
    def self.encrypt(value)
      return "" if value.nil? || value.empty?

      ::Digest::SHA1.hexdigest(value.to_s)
    end

    def self.uuid
      SecureRandom.uuid
    end

    def self.random_token(length = 40)
      ::SecureRandom.urlsafe_base64(length)
    end

    # Returns random number as string for admin 2-step authentication
    def self.verification_code(length = 6)
      value = ""

      if length.nil? || length.zero?
        length = 6
      elsif length > 20
        length = 20
      end

      length.times do |num|
        value += SecureRandom.random_number(10).to_s
      end

      value
    end
  end
end
