class Api::V1::BaseController < ApplicationController
    protect_from_forgery :except => [:sample]
    skip_before_filter  :verify_authenticity_token
end