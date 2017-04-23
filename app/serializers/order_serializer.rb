class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status

  link(:self) { order_path(object.id) }
end
