class Stock < ApplicationRecord
    has_many :transactions
    has_many :users, through: :transactions


    def self.iex_client 
        @client = IEX::Api::Client.new(
            publishable_token: 'pk_63c24619b1dc4a1da70647a6a5e15647',
            secret_token: 'sk_007deba5592945e7a15e5e63e656840c',
            endpoint: 'https://cloud.iexapis.com/v1'
        )
    end
end
