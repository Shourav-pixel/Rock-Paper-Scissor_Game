require 'openssl'
require 'securerandom'
require_relative '../interfaces/generator_interface'

class Generator
  def generate_key
    SecureRandom.hex(32)
  end

  def generate_hmac(key, data)
    hmac = OpenSSL::HMAC.new(key, OpenSSL::Digest.new('sha256'))
    hmac << data
    hmac.hexdigest
  end
end
