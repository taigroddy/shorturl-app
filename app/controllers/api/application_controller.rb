module Api
  class ApplicationController < ActionController::API
    include Pagy::Backend
    include Serializable

    before_action :headers_has_api_key?, :current_user

    protected

    def json_error_response(message, status: :unauthorized)
      json_response({ error: true, message: message }, status: status)
    end

    def json_response(data, status: :ok)
      render json: data, status: status
    end

    def api_key
      request&.headers&.fetch('Api-key')
    end

    def headers_has_api_key?
      json_error_response('You can not access this page!') if api_key.blank?
    end

    def current_user
      @current_user ||= User.find_by(api_key: api_key)
    rescue StandardError
      json_error_response('You can not access this page! Api key is wrong!')
    end

    def parameters
      request.parameters
    end
  end
end
