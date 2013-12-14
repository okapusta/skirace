class CachingService
  takes :memcache_connection

  def get(key)
    memcache_connection.client.get(key)
  end

  def set(key, value)
    memcache_connection.client.set(key, value)
  end
end