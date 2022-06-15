class ShortLinkSerializer < ActiveModel::Serializer
  attributes :id, :url, :slug, :destination
end
