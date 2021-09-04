class StocksController < ApplicationController

    def transact
        @user = User.find(params[:id])
        @transaction = Transaction.find(params[:id])
        @stock = Stock.find(params[:id])
        if @transaction.buy == true
            @user.balance -= (@transaction.price * @transaction.quantity)
            @stock.quantity -= @transaction.quantity
        elsif @transaction.sell == true
            @user.balance += (@transaction.price * @transaction.quantity)
            @stock.quantity += @transaction.quantity
        end
    end


end