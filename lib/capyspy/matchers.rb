require 'rspec/expectations'

RSpec::Matchers.define :have_been_called do
  match do |actual|
    spy = actual.is_a?(Capyspy::Spy) ? actual : Capyspy::Spy.new(page, actual)
    spy.calls.present?
  end
  
  failure_message_for_should do |actual|
    "expected #{actual.to_s} to have been called"
  end
  
  failure_message_for_should_not do |actual|
    "expected #{actual.to_s} not to have been called"
  end
end