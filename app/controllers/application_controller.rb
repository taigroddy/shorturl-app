class ApplicationController < ActionController::Base
  include ErrorBuilder

  before_action :authenticate_user!

  protected

  def parameters
    request.parameters
  end
end
