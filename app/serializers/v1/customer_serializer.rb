class V1::CustomerSerializer < ActiveModel::Serializer
  attributes :name, :email

  link(:self) { customer_url(object.id) }
  link(:orders) { customer_orders_url(object) }
end
