class ApplicationController < ActionController::API
  def paged(collection)
    if params.has_key?(:page)
      return collection.page(params[:page][:number]).per(params[:page][:size])
    end

    collection.all
  end
end
