class StocksController < ApplicationController

    def index
        @stocks = Stock.all
    end

    def transact
        # @user = User.find(params[:id])
        # @transaction = Transaction.find(params[:id])
        # @stock = Stock.find(params[:stock_id])
        # byebug
        @transaction = Transaction.create!(
            stock_id: params[:transact][:stock_id],
            user_id: current_user.id,
            buy: params[:transact][:buy],
            sell: params[:transact][:sell],
            price: Stock.find(params[:transact][:stock_id]).price,
            quantity: params[:transact][:quantity]
        )
        @user = User.find(@transaction.user_id)
        @stock = Stock.find(@transaction.stock_id)
        if @transaction.buy == true
            @user.balance -= (@transaction.price * @transaction.quantity)
            @stock.quantity -= @transaction.quantity
            @user.save!
            @stock.save!
        elsif @transaction.sell == true
            @user.balance += (@transaction.price * @transaction.quantity)
            @stock.quantity += @transaction.quantity
            @user.save!
            @stock.save!
        end

        redirect_to users_path
        flash[:notice] = "Transaction successful"
    end


    # private
    #     def stock_params
    #         params.require(:transaction).permit()
    #     end
end