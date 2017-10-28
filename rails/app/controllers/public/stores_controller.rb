class Public::StoresController < Public::BaseController
    def index
    end

    def new
        @container = Container.new
    end

    def create
        # sender = @container.address
        # payment = Payment.create(sender:sender,receiver:"0x0b9d052652f94547464746a08e8281cd7aa6e059",paymount:100)
        if @container.save
            print "Saved"
        else
            print "Failed"
        end
        render 'new'
    end
end