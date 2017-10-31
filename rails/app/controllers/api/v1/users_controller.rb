class Api::V1::UsersController < Api::V1::BaseController
    def index
    end
    
    def new
    end

    def create
        @user = User.new(email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation])
        if @user.save
            @container = @user.containers.build
            render :json => {container: @container, "balance":@user.balance}.to_json
        else
            error = {
                message:"Signup Error",
            }
            render :json => {error:error}.to_json
        end
    end
end