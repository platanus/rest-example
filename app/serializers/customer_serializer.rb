class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  link(:self) { customer_path(object.id) }
  link(:orders) { customer_orders_path(object) }
end
