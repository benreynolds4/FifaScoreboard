ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'mongoid'
require 'rspec/rails'
require 'rspec/autorun'
#require 'factory_girl_rails'
require 'forgery'
require 'rails/mongoid'
require 'database_cleaner'
require 'mongoid-rspec'
require 'capybara/poltergeist'
require 'launchy'

Mongoid.load!(Rails.root.join("config", "mongoid.yml"))

Rails.backtrace_cleaner.remove_silencers!


Capybara.register_driver :poltergeist do |app|
  options = {
    js_errors: false
  }
  Capybara::Poltergeist::Driver.new(app, options)
end
Capybara.javascript_driver = :poltergeist

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
RSpec.configure do |config|
  config.mock_with :rspec
  #config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end

  # config.extend ControllerMacros, :type => :controller
end
