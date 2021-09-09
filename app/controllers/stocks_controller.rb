class StocksController < ApplicationController

    def index
        @stocks = Stock.all

        
    end

    def transact

        # TAKE TWO IF BLAH BLAH
        @stock_bought = Transaction.where(user_id:current_user.id,stock_id:params[:transact][:stock_id], buy:true).sum(:quantity)
        @stock_sold = Transaction.where(user_id:current_user.id,stock_id:params[:transact][:stock_id], sell:true).sum(:quantity)
        @stock_active = @stock_bought - @stock_sold
        @user = User.find(current_user.id)
        @stock = Stock.find(params[:transact][:stock_id])

        if params[:transact][:buy] == "1"
            @transaction = Transaction.create!(
                stock_id: @stock.id,
                user_id: current_user.id,
                buy: params[:transact][:buy],
                sell: params[:transact][:sell],
                price: @stock.price,
                quantity: params[:transact][:quantity].to_i
            )
            @user.balance -= (@transaction.price * @transaction.quantity)
            @stock.quantity -= @transaction.quantity
            @user.save!
            @stock.save!

            redirect_to users_path
            flash[:success] = "Transaction successful"
        elsif (params[:transact][:sell] == "1") && (@stock_active >= params[:transact][:quantity].to_i)
            @transaction = Transaction.create!(
                stock_id: @stock.id,
                user_id: current_user.id,
                buy: params[:transact][:buy],
                sell: params[:transact][:sell],
                price: @stock.price,
                quantity: params[:transact][:quantity].to_i
            )
            @user.balance += (@transaction.price * @transaction.quantity)
            @stock.quantity += @transaction.quantity
            @user.save!
            @stock.save!

            redirect_to users_path
            flash[:success] = "Transaction successful"
        elsif (params[:transact][:sell] == "1") && (@stock_active < params[:transact][:quantity].to_i)
            redirect_to users_path
            flash[:alert] = "You do not have enough of this stock to sell."
        end

        # byebug

    end


    # private
    #     def stock_params
    #         params.require(:transaction).permit()
    #     end
end