IEX::Api.configure do |config|
    config.publishable_token = ENV['IEX_API_PUBLISHABLE_TOKEN'] # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = ENV['IEX_API_SECRET_TOKEN'] # defaults to ENV['IEX_API_SECRET_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end

client = IEX::Api::Client.new(
    publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
    secret_token: ENV['IEX_API_SECRET_TOKEN'],
    endpoint: 'https://cloud.iexapis.com/v1'
)