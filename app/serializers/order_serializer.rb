class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status

  link(:self) { order_path(object.id) }
  link(:items) { order_items_path(object) }
end
