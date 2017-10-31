class Api::V1::SessionsController < Api::V1::BaseController
    def create
        @user = User.find_by(email:params[:email])
        if @user && @user.authenticate(params[:password_digest])
            @container = @user.containers
            render :json => {container: @container, "balance":@user.balance}.to_json
        else
            error = {
                message:"Login error",
            }
            render :json => {error:error}.to_json
        end
    end
end
