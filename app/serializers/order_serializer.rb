class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status

  link(:self) { order_url(object.id) }
  link(:items) { order_items_url(object) }
end
