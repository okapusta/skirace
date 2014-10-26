class Options

  takes :configuration_service, :hash

  def capacitor
    OpenStruct.new(pin: 7)
  end

  def memcache_server
    'localhost:11211'
  end

  def memcache_client
    {
      namespace: 'skirace',
      compress: true,
      expires_in: 300
    }
  end

  def password_cost
    10
  end

  def activation_threshold
    3
  end

  def measurement_accuracy
    0.001
  end
end