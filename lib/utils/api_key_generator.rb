# frozen_string_literal: true

##
# Utils::ApiKeyGenerator
##
module Utils
  module ApiKeyGenerator
    module_function

    def encode(email:)
      verifier.generate({
                          email: email,
                          generated_at: Time.now
                        })
    end

    def decode(signature)
      verifier.verify(signature)
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      {}
    end

    def verifier
      ActiveSupport::MessageVerifier.new(ENV['SHARE_SECRET_KEY'], digest: 'MD5')
    end
  end
end
