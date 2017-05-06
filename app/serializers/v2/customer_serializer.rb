class V2::CustomerSerializer < ActiveModel::Serializer
  attributes :identifier, :name

  def identifier
    object.email
  end

  link(:self) { customer_url(object.id) }
  link(:orders) { customer_orders_url(object) }
end
