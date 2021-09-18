module Users
  module Links
    ##
    # Users::Links::UpdateService
    ##
    class UpdateService < ApplicationService
      step :validate
      step :pesist

      protected

      def validate(input)
        validation = Users::Links::UpdateContract.call(input)

        if validation.success?
          Success(validation.to_h)
        else
          Failure(validation.errors.to_h)
        end
      end

      def pesist(input)
        link, params = input.values_at(:resource, :link)

        if link.update(params)
          Success(link)
        else
          Failure(link.errors.to_h)
        end
      end
    end
  end
end
