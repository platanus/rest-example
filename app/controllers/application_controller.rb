class ApplicationController < ActionController::API
  include Api::ErrorConcern if Rails.env.production?
  include Api::Paged
  include Api::Versioned
  include Api::Deprecated
  include Api::Search

  self.responder = ApiResponder

  respond_to :json
end
