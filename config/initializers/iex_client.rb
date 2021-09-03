IEX::Api.configure do |config|
    config.publishable_token = 'pk_63c24619b1dc4a1da70647a6a5e15647' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = 'sk_007deba5592945e7a15e5e63e656840c' # defaults to ENV['IEX_API_SECRET_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end

client = IEX::Api::Client.new(
    publishable_token: 'pk_63c24619b1dc4a1da70647a6a5e15647',
    secret_token: 'sk_007deba5592945e7a15e5e63e656840c',
    endpoint: 'https://cloud.iexapis.com/v1'
)