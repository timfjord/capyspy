module Capyspy
  class Spy
    attr_reader :page, :method
    
    def initialize(page, method)
      @page = page
      @method = method.to_s
      
      init
    end
    
    def and_call_through
      with_spy 'callThrough = true'
      self
    end
    
    def and_return(value)
      with_spy 'callThrough = false', "fake = function() { return #{value.to_json}; }"
      self
    end
    
    def and_call_fake(function)
      with_spy 'callThrough = false', "fake = #{function}"
      self
    end
    
    def calls
      with_spy 'calls'
    end
    
    def to_s
      method
    end
    
    private
      
      def init
        page.evaluate_script <<JS
(function() {
  window._capyspy = window._capyspy || {};
  if (!window._capyspy['#{method}']) {
    window._capyspy['#{method}'] = {
      callThrough: false,
      calls: [],
      fake: function() {},
      original: window.#{method}
    };
  
    window.#{method} = function() {
      var spy = window._capyspy['#{method}'];
      spy.calls.push(Array.prototype.slice.call(arguments, 0));
      if (spy.callThrough) {
        return spy.original.apply(this, arguments);
      } else {
        return spy.fake.apply(this, arguments);
      }
    }
  }
})();
JS
      end
      
      def with_spy(*expressions)
        raise ArgumentError if expressions.empty?
        expressions.each do |expression|
          page.evaluate_script "window._capyspy['#{method}'].#{expression};"
        end
      end
  end
end