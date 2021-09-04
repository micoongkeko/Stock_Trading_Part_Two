# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Stock.destroy_all
Transaction.destroy_all

User.create(email:"admin@admin.com", password:"password", admin_role:true, trader_role:true, approved:true)
User.create(email:"trader@trader.com", password:"password", admin_role:false, trader_role:true, approved:false)
User.create(email:"approvedtrader@trader.com", password:"password", admin_role:false, trader_role:true, approved:true)

Stock.create(symbol:"AAPL", name: Stock.iex_client.quote("AAPL").company_name, price: Stock.iex_client.quote("AAPL").latest_price, quantity:2000)
Stock.create(symbol:"AAPL", name: Stock.iex_client.quote("MSFT").company_name, price: Stock.iex_client.quote("MSFT").latest_price, quantity:2000)
Stock.create(symbol:"AAPL", name: Stock.iex_client.quote("AMZN").company_name, price: Stock.iex_client.quote("AMZN").latest_price, quantity:2000)
Stock.create(symbol:"AAPL", name: Stock.iex_client.quote("FB").company_name, price: Stock.iex_client.quote("FB").latest_price, quantity:2000)
Stock.create(symbol:"AAPL", name: Stock.iex_client.quote("TSLA").company_name, price: Stock.iex_client.quote("TSLA").latest_price, quantity:2000)
Stock.create(symbol:"AAPL", name: Stock.iex_client.quote("NVDA").company_name, price: Stock.iex_client.quote("NVDA").latest_price, quantity:2000)
Stock.create(symbol:"AAPL", name: Stock.iex_client.quote("PYPL").company_name, price: Stock.iex_client.quote("PYPL").latest_price, quantity:2000)