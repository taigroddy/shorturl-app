module Api
  module Users
    class LinkManagementsController < Api::ApplicationController
      def index
        json_response(paginated_serialize(collection))
      end

      def generate_short_url
        ::Users::Links::CreateService.call(parameters.merge(user: current_user)) do |operation|
          operation.success { |data| json_response(serialize(data), status: :created) }
          operation.failure { |error| json_error_response(error, status: 422) }
        end
      end

      private

      def collection
        current_user.links
      end

      def serializer
        ::LinkSerializer
      end
    end
  end
end
