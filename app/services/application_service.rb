class ApplicationService
  include Dry::Transaction

  class << self
    delegate :call, to: :new
  end
end
