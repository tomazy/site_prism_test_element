$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'site_prism_test_element'
require "capybara"

RSpec.configure do |config|
  config.include Capybara::DSL
end
