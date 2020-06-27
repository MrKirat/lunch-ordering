RSpec.configure do |config|

  # Without it, the database_cleaner will destroy Active Record’s environment data,
  # resulting in a NoEnvironmentInSchemaError every time your tests run
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation, except: %w(ar_internal_metadata)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end