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

        duration = params[:duration]
        delivery_date = params[:date]

        @container.delivery_date = delivery_date
        @container.duration = duration

        if @container.status == 2
            # そもそも2だったらスルー
        elsif params[:status] == 2
            # ２じゃなかったけど、これから2になるやつ
            @payment = @container.payment

            sender_addr = @payment.sender
            shop_addr = @payment.shop
            mount = @payment.mount

            @sender = User.find_by(address:sender_addr)
            @shop = User.find_by(address:shop_addr)
            fee = mount*0.01
            @sender.balance -= mount*0.99
            @shop.balance += mount*0.99
            @company = User.find_by(address:"0x44fed900d34cde7a9ce819c08f4a2ad6088266eb")
            @company.balance += fee
            @company.save
            @sender.save
            @shop.save

        else
            # 2じゃなかったし、これから2にもならないやつ
        end 

        @container.status = ( params[:status].nil? ?  @container.status : params[:status])

        @container.save
        render :json => @container.to_json
    end
    
    def new
    end

    def create
    end

    private
end