class Public::PaymentsController < Public::BaseController
    def index
        @user = User.find_by(address:"0x44fed900d34cde7a9ce819c08f4a2ad6088266eb")
    end

    def new
        @payment = Payment.new
    end

    def create
        @user = User.find_by(address:params[:payment][:sender])
        @container = @user.containers.build(name:"グラノーラ",delivery_date:"2017-11-2", purchase_date:"2017-11-2", photo:"https://s3-ap-northeast-1.amazonaws.com/myblock/gura.png", duration:2,status:0)
        @payment = @container.build_payment(sender:params[:payment][:sender],shop:"0x0b9d052652f94547464746a08e8281cd7aa6e059",mount:600)
    
        if @payment.save
            print "Saved"
            render 'show'
        else
            print "Failed"
            render 'new'
        end
    end

    def show
    end
end