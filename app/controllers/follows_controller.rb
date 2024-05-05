class FollowsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user

    def follow
        currrent_user.send_follow_request_to(@user)
        @user.acccept_follow_request_of(current_user)

    end

    private

    def set_user
        @user = user.find(params[:id])
    end

    def follow_params
        params.permit(:id)
    end

end
