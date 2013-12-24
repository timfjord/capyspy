# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capyspy/version'

Gem::Specification.new do |spec|
  spec.name          = "capyspy"
  spec.version       = Capyspy::VERSION
  spec.authors       = ["Tima Maslyuchenko "]
  spec.email         = ["insside@gmail.com"]
  spec.description   = %q{Mock js objects with capybara}
  spec.summary       = %q{Mock js objects with capybara}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "capybara"
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
