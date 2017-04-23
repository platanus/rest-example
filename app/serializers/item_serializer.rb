class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :quantity, :price

  link(:self) { item_url(object.id) }
end
