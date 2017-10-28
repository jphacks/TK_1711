class Api::V1::ContainersController < Api::V1::BaseController
    def index
        @containers = {"container":Container.all}
        render :json => @containers.to_json
    end
    
    def new
    end

    def create
    end
end