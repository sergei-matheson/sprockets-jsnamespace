# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sprockets-jsnamespace/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sergei Matheson"]
  gem.email         = ["sergei.matheson@gmail.com"]
  gem.description   = %q{Adds support for simple javascript namespacing to sprockets}
  gem.summary       = %q{Adds support for simple javascript namespacing to sprockets}
  gem.homepage      = "http://github.com/sergei-matheson/sprockets-jsnamespace"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sprockets-jsnamespace"
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "sprockets", "2.1.3"
  gem.add_runtime_dependency "multi_json"
  
  #Development only dependencies
  gem.add_development_dependency 'ruby-debug-base19x'
  gem.add_development_dependency 'ruby-debug19'
  gem.add_development_dependency 'linecache19'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'execjs'

  gem.version       = Sprockets::Jsnamespace::VERSION
end
