module Users
  ##
  # Users::LinkManagementsController
  ##
  class LinkManagementsController < ApplicationController
    before_action :set_link, only: [:show, :edit, :update, :destroy]

    def index
      @links = resources
    end

    def show; end

    def new
      @link = Link.new
    end

    def edit; end

    # rubocop:disable Metrics/MethodLength
    def create
      ::Users::Links::CreateService.call(parameters.merge(user: current_user)) do |operation|
        operation.success do |data|
          @link = data
          redirect_to links_path, notice: "Link management was successfully created."
        end

        operation.failure do |errors|
          @link = Link.new
          @errors = build_errors_message(errors)
          render :new, status: :unprocessable_entity
        end
      end
    end
    # rubocop:enable Metrics/MethodLength

    def update
      ::Users::Links::UpdateService.call(parameters.merge(resource: @link)) do |operation|
        operation.success do |data|
          @link = data
          redirect_to links_path, notice: "Link management was successfully created."
        end

        operation.failure do |errors|
          @errors = build_errors_message(errors)
          render :edit, status: :unprocessable_entity
        end
      end
    end

    def destroy
      @link.destroy

      redirect_to links_url, notice: "Link management was successfully destroyed."
    end

    def redirect
      @link = Link.find_by(short_path: params[:short_path])

      @link.inc(num_of_click: 1)

      redirect_to @link.original_url
    rescue Mongoid::Errors::DocumentNotFound
      raise ActionController::RoutingError.new('Not Found', 404)
    end

    private

    def resources
      @resources ||= current_user.links
    end

    def set_link
      @link = resources.find(params[:id])
    end
  end
end
