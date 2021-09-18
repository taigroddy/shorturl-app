class Link
  delegate :url_helpers, to: 'Rails.application.routes'

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :original_url, type: String
  field :short_path, type: String
  field :num_of_click, type: Integer, default: 0

  ## Shard key
  shard_key :short_path

  ## Relation
  belongs_to :user

  ## Scope
  default_scope { order(created_at: :desc) }

  ## Validation
  validates :name, presence: true
  validates :original_url, format: { with: LINK_VALIDATION_REGEX }

  ## Static indexes
  index({ short_path: 1 }, { unique: true, name: "short_path_index" })

  ## Callback action
  after_create :generate_short_path

  def short_url
    url_helpers.redirect_original_url(short_path: short_path || '')
  end

  private

  def generate_short_path
    # NOTE: Get `incrementing counter` from ObjectId
    # Read more about ObjectId: https://docs.mongodb.com/manual/reference/method/ObjectId/
    increment = Link.first.id.marshal_dump.unpack("N*").pop

    self.short_path = Utils::Base62Encoder.from_base10(increment, NUM_OF_SHORT_URL_CHAR)

    save
  end
end
