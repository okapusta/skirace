class Options

  takes :configuration_service, :hash

  def memcache_server
    configuration_service.get_config[:memcache_server]
  end

  def memcache_client
    hash.symbolize_keys!(
      configuration_service.get_config[:memcache_options]
      )
  end

  def password_cost
    10
  end
end