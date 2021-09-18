require 'database_cleaner/mongoid'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:mongoid].strategy = :deletion
    DatabaseCleaner[:mongoid].clean_with(:deletion)
  end

  config.around do |example|
    DatabaseCleaner[:mongoid].cleaning do
      example.run
    end
  end
end
