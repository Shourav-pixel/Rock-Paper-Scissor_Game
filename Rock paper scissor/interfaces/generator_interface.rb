module GeneratorInterface
    def generate_key
      raise NotImplementedError, "Method 'generate_key' must be implemented"
    end
  
    def generate_hmac(key, data)
      raise NotImplementedError, "Method 'generate_hmac' must be implemented"
    end
  end
  