class GroupEventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location, :starts_at, :ends_at, :published
end
