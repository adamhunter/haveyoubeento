Yelp.client.configure do |config|
  %w[consumer_key consumer_secret token token_secret].each do |key|
    config.send "#{key}=", Rails.application.secrets.yelp[key]
  end
end

