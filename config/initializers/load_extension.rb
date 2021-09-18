# Load Api Key generator
require Rails.root.join('lib/utils/api_key_generator')

# Load Base62 decoder
require Rails.root.join('lib/utils/base62_encoder')

# Fixed issues mongoid of Pagy
require Rails.root.join('lib/pagy/backend')
