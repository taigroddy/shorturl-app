require 'pagy'
##
# Serializers provide methods to controller for serialization
##
module Serializable
  def serializer
    raise 'Not provided'
  end

  def serialize(data, options = {})
    serializer.new(data, options).serializable_hash
  end

  def paginated_serialize(data, options = {})
    pagy, records = pagy(data)
    metadata = pagy_metadata(pagy, true)

    options = {
      is_collection: true,
      meta: metadata.slice(:count, :page, :items),
      links: metadata.slice(:scaffold_url, :next_url, :last_url)
    }.merge(options)

    serialize(records, options)
  end
end
