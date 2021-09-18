class LinkSerializer
  include JSONAPI::Serializer

  attributes :name, :original_url, :short_url, :created_at, :num_of_click
end
