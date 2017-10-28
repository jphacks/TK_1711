class Public::PaymentsController < Public::BaseController
    def index
    end

    def new
        @payment = Payment.new
    end

    def create
        @user = User.find_by(address:params[:payment][:sender])
        @container = @user.containers.build(name:"卵",date:"2017-11-2", photo:"https://s3-ap-northeast-1.amazonaws.com/myblock/egg.jpg", duration:2,status:0)
        @payment = @container.build_payment(sender:params[:payment][:sender],shop:"0x0b9d052652f94547464746a08e8281cd7aa6e059",mount:100)
    
        if @payment.save
            print "Saved"
            render 'index'
        else
            print "Failed"
            render 'new'
        end
    end
end