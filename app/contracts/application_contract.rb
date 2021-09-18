class ApplicationContract < Dry::Validation::Contract
  class << self
    delegate :call, to: :new
  end
end
