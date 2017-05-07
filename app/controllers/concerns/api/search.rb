module Api::Search
  extend ActiveSupport::Concern

  def search(collection)
    q = collection
    filters = parse_filter_param
    q = q.ransack(filters).result if filters
    sort_query = parse_sort_param
    q = q.order(sort_query) if sort_query
    q
  end

  private

  def parse_sort_param
    return unless params[:sort]
    params[:sort].split("|").inject([]) do |memo, k|
      orientation, attribute = k.match(/\A(-|)([a-z|_]*)\Z/).captures
      memo << "#{attribute} #{orientation == '-' ? 'DESC' : 'ASC'}"
    end.join(", ")
  end

  def parse_filter_param
    return unless params[:filter]
    params[:filter].split("|").inject({}) do |memo, kv|
      k, v = kv.split("::")
      memo["#{k}_eq"] = v
      memo
    end
  end
end
