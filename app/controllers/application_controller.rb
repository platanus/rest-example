class ApplicationController < ActionController::API
  include ApiErrorConcern if Rails.env.production?
  include Paged
  include Versioned
  include Deprecated
  include Filtered

  self.responder = ApiResponder

  respond_to :json
end
