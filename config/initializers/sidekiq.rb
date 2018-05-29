Sidekiq.configure_server do |config|
    config.redis = { url: ENV['REDISCLOUD_URL'] || 'redis://redis:6379' }
end

Sidekiq.configure_client do |config|
    config.redis = { size: 3, url: ENV['REDISCLOUD_URL'] || 'redis://redis:6379' }
end