class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    #     params[:id] == current_user.id unless params[:id]
    #     @user = User.find(params[:id])
    #     @user_subscriptions = UserSubscription.find_active_subscriptions_by_user(@user)
    end



end
