class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  field :email,              type: String
  field :encrypted_password, type: String
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time
  field :remember_created_at, type: Time
  field :api_key, type: String, default: -> { Utils::ApiKeyGenerator.encode(email: email) }

  ## Relation
  has_many :links, dependent: :destroy

  ## Static indexes
  index({ email: 1 }, { unique: true, name: "email_index" })
  index({ api_key: 1 }, { unique: true, name: "api_key_index" })
end
