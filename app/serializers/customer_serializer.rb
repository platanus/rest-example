class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  link(:self) { customer_path(object.id) }
end
