module Users
  module Links
    ##
    # Users::Links::CreateService
    ##
    class CreateService < ApplicationService
      step :validate
      step :pesist
      step :generate_short_path

      protected

      def validate(input)
        validation = Users::Links::CreateContract.call(input)

        if validation.success?
          Success(validation.to_h)
        else
          Failure(validation.errors.to_h)
        end
      end

      def pesist(input)
        link, user = input.values_at(:link, :user)

        link = ::Link.create(**link, user: user)

        if link
          Success(link)
        else
          Failure(link.errors.to_h)
        end
      end

      def generate_short_path(link)
        # NOTE: Get `incrementing counter` from ObjectId
        # Read more about ObjectId: https://docs.mongodb.com/manual/reference/method/ObjectId/
        increment = link.id.marshal_dump.unpack("N*").pop

        link.short_path = Utils::Base62Encoder.from_base10(increment, NUM_OF_SHORT_URL_CHAR)

        if link.save
          Success(link)
        else
          Failure(link.errors.to_h)
        end
      end
    end
  end
end
