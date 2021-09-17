module Users
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

    def create
      @link = Link.new(link_params)

      respond_to do |format|
        if @link.save
          format.html { redirect_to links_path, notice: "Link management was successfully created." }
          format.json { render :index, status: :ok, links: resources }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @link.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @link.update(link_params)
          format.html { redirect_to links_path, notice: "Link management was successfully updated." }
          format.json { render :index, status: :ok, links: resources }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @link.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @link.destroy
      respond_to do |format|
        format.html { redirect_to links_url, notice: "Link management was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    def resources
      @resources ||= current_user.links
    end

    def set_link
      @link = resources.find(params[:id])
    end

    def link_params
      params.fetch(:link, {}).permit(:name, :original_url).merge({ user: current_user })
    end
  end
end
