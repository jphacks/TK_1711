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
        if params[:date].nil? 
            delivery_date = @container.delivery_date
        else
            delivery_date = params[:date]
        end
        duration = params[:duration].to_i
        # status = params[:status].to_i

        if params[:status].nil?
            status = @container.status
        else
            status = params[:status].to_i
        end

        if @container.status == status 
            # 2ならばそのままで放置。
            puts "This is already finished"
        elsif status == 2
            @container.delivery_date = delivery_date
            @container.duration = duration
            @container.status = status

            # Status 2になったときに契約書を参照する。

            @payment = @container.payment

            sender_addr = @payment.sender
            shop_addr = @payment.shop
            mount = @payment.mount

            @sender = User.find_by(address:sender_addr)
            @shop = User.find_by(address:shop_addr)
            @sender.balance -= mount
            @shop.balance += mount 
            @sender.save
            @shop.save
        else
            # 従来が3以外で、params[：id]が３ではないときは更新。
            @container.delivery_date = delivery_date
            @container.duration = duration
            @container.status = status
        end

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