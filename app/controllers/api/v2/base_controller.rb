class Api::V2::BaseController < ApplicationController
  before_action do
    self.namespace_for_serializer = ::V2
  end
end
