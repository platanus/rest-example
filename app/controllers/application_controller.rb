class ApplicationController < ActionController::API
  include ApiErrorConcern if Rails.env.production?
  include Paged

  self.responder = ApiResponder

  respond_to :json
end
