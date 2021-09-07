class StocksController < ApplicationController

    def index
        @stocks = Stock.all

        
    end

    def transact
        # @user = User.find(params[:id])
        # @transaction = Transaction.find(params[:id])
        # @stock = Stock.find(params[:stock_id])
        # byebug

        # BACK UP LOL
        # @transaction = Transaction.create!(
        #     stock_id: params[:transact][:stock_id],
        #     user_id: current_user.id,
        #     buy: params[:transact][:buy],
        #     sell: params[:transact][:sell],
        #     price: Stock.find(params[:transact][:stock_id]).price,
        #     quantity: params[:transact][:quantity]
        # )
        # @stock_bought = Transaction.where(user_id:current_user.id,stock_id:@stock.id, buy:true).sum(:quantity)
        # @stock_sold = Transaction.where(user_id:current_user.id,stock_id:@stock.id, sell:true).sum(:quantity)
        # @stock_active = @stock_bought - @stock_sold
        # @user = User.find(@transaction.user_id)
        # @stock = Stock.find(@transaction.stock_id)
        # if @transaction.buy == true
        #     @user.balance -= (@transaction.price * @transaction.quantity)
        #     @stock.quantity -= @transaction.quantity
        #     @user.save!
        #     @stock.save!
        # elsif @transaction.sell == true && @stock_active >= @stock.quantity
        #     @user.balance += (@transaction.price * @transaction.quantity)
        #     @stock.quantity += @transaction.quantity
        #     @user.save!
        #     @stock.save!


        # TAKE TWO IF BLAH BLAH
        
        @stock_bought = Transaction.where(user_id:current_user.id,stock_id:params[:transact][:stock_id], buy:true).sum(:quantity)
        @stock_sold = Transaction.where(user_id:current_user.id,stock_id:params[:transact][:stock_id], sell:true).sum(:quantity)
        @stock_active = @stock_bought - @stock_sold
        @user = User.find(current_user.id)
        @stock = Stock.find(params[:transact][:stock_id])

        
        if params[:transact][:buy] = true
            @transaction = Transaction.create!(
                stock_id: params[:transact][:stock_id],
                user_id: current_user.id,
                buy: params[:transact][:buy],
                sell: params[:transact][:sell],
                price: Stock.find(params[:transact][:stock_id]).price,
                quantity: params[:transact][:quantity]
            )
            @user.balance -= (@transaction.price * @transaction.quantity)
            @stock.quantity -= @transaction.quantity
            @user.save!
            @stock.save!
        elsif (params[:transact][:sell] = true) && (@stock_active >= params[:transact][:quantity])
            @user.balance += (@transaction.price * @transaction.quantity)
            @stock.quantity += @transaction.quantity
            @user.save!
            @stock
        elsif @stock_active < params[:transact][:quantity]
            flash[:notice] = "You do not have enough of this stock to sell."
        end

        byebug
        redirect_to users_path
        flash[:notice] = "Transaction successful"
    end


    # private
    #     def stock_params
    #         params.require(:transaction).permit()
    #     end
end