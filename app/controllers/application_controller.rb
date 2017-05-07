class ApplicationController < ActionController::API
  include Api::Error
  include Api::Paged
  include Api::Versioned
  include Api::Deprecated
  include Api::Search

  self.responder = ApiResponder

  respond_to :json
end
