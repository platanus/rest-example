class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  link(:self) { customer_url(object.id) }
  link(:orders) { customer_orders_url(object) }
end
