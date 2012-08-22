# -*- encoding: utf-8 -*-
require File.expand_path('../lib/coloring/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["DoZator"]
  gem.email         = ["dozator@me.com"]
  gem.description   = %q{Adds methods for coloring and styling text for class String}
  gem.summary       = %q{Terminal text painter}
  gem.homepage      = ""

  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "coloring"
  gem.require_paths = ["lib"]
  gem.version       = Coloring::VERSION
end

