require 'capyspy/version'
require 'capyspy/dsl'
require 'capyspy/spy'

if defined? RSpec
  require 'capyspy/matchers'
end

module Capybara::DSL
  include Capyspy::DSL
end
