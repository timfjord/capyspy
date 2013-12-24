module Capyspy
  module DSL
    def spy_on(method)
      Spy.new page, method
    end
  end
end