module Api
  module Users
    class LinkManagementsController < Api::BaseController
      def index
        json_response(paginated_serialize(collection))
      end

      def generate_short_url
        link = Link.new(link_params)

        if link.save
          json_response(serialize(link))
        else
          json_error_response(link.errors.to_h)
        end
      end

      private

      def collection
        current_user.links
      end

      def serializer
        ::LinkSerializer
      end

      def link_params
        params.fetch(:link, {}).permit(:name, :original_url).merge({ user: current_user, short_path: SecureRandom.alphanumeric(7) })
      end
    end
  end
end
