class Api::V1::BaseController < ApplicationController
	before_filter :verify_authenticity_token
	
	respond_to :json
end