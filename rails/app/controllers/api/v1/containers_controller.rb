class Api::V1::ContainersController < Api::V1::BaseController
    def index
        @containers = {"container":Container.all}
        render :json => @containers.to_json
    end

    def show
        @container = {"container":Container.find(params[:id])}
        render :json => @container.to_json
    end
    
    def new
    end

    def create
    end
end