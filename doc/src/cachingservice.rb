class CachingService
  takes :memcache_connection

  def get(key)
    memcache_connection.client.get(key)
  end

  def set(key, value)
    if memcache_connection.client.set(key, value)
      return value
    end
  end

  def fetch(key, &block)
    result = get(key)
    return result if result
    
    set(key, yield)
  end
end