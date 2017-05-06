module Filtered
  extend ActiveSupport::Concern

  def filtered(collection)
    filters = parse_filters
    return collection unless filters
    collection.ransack(filters).result
  end

  private

  def parse_filters
    return unless params[:filter]
    filters = params[:filter].split("|")
    filters.inject({}) do |memo, kv|
      k, v = kv.split("::")
      memo["#{k}_eq"] = v
      memo
    end
  end
end
