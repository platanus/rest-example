class Api::V1::BaseController < ApplicationController
  before_action do
    self.namespace_for_serializer = ::V1
  end
end
