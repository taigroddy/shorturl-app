class Link
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :original_url, type: String
  field :short_url, type: String

  ## Relation
  belongs_to :user

  # Scope
  default_scope { order(created_at: :desc) }

  ## Validation
  validates :name, presence: true
  validates :original_url, format: { with: LINK_VALIDATION_REGEX }

  ## Static indexes
  index({ short_url: 1 }, { unique: true, name: "short_url_index" })
end
