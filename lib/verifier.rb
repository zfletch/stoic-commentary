class Verifier
  def initialize(key, digest: 'SHA256')
    @verifier = ActiveSupport::MessageVerifier.new(key, digest: digest)
  end

  def encode(message, expires_in:, purpose:)
    verifier.generate(message, expires_in: expires_in, purpose: purpose)
  end

  def decode(message, purpose:)
    verifier.verified(message, purpose: purpose)
  end

  private

  attr_reader :verifier
end
