class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :quantity, :price

  link(:self) { item_path(object.id) }
end
