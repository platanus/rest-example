class V2::CustomerSerializer < ActiveModel::Serializer
  attributes :identifier, :name, :email

  def identifier
    Digest::SHA256.hexdigest(object.id.to_s)
  end
end
