module Users
  module Links
    ##
    # Users::Links::UpdateContract
    ##
    class UpdateContract < ApplicationContract
      params do
        required(:resource).filled(type?: Link)
        required(:link).hash(Users::Links::CreateContract::BASE_PARAMS)
      end
    end
  end
end
