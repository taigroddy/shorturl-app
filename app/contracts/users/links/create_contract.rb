module Users
  module Links
    ##
    # Users::Links::CreateContract
    ##
    class CreateContract < ApplicationContract
      BASE_PARAMS = Dry::Schema.Params do
        required(:name).filled(:string)
        required(:original_url).filled(:string, format?: LINK_VALIDATION_REGEX)
      end

      params do
        required(:link).hash(BASE_PARAMS)
        required(:user).filled(type?: User)
      end
    end
  end
end
