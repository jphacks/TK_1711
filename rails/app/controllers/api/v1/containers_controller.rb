class Api::V1::ContainersController < Api::V1::BaseController

    def index
        @user = User.find(params[:id])
        @containers = @user.containers
        @containers = {"container":@containers,"balance":@user.balance}
        render :json => @containers.to_json
    end

    def show
        @container = Container.find(params[:id])
        render :json => @container.to_json
    end

    def edit
    end

    def update
        @container = Container.find(params[:id])
        delivery_date = params[:date]
        duration = params[:duration].to_i
        status = params[:status].to_i

        @container.delivery_date = delivery_date
        @container.duration = duration
        @container.status = status

        if @container.save
            render :json => @container.to_json
        else
            error = {error:"error"}
            render :json => error.to_json
        end
    end
    
    def new
    end

    def create
    end

    private
end