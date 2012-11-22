# -*- encoding: utf-8 -*-
require File.expand_path('../lib/resque-async-method-enhanced/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Joel AZEMAR', 'Nick Ragaz']
  gem.email         = ['joel.azemar@gmail.com', 'nick.ragaz@gmail.com']
  gem.description   = %q{Make Active Support instance methods asynchronous using resque.}
  gem.summary       = %q{Make Active Support instance methods asynchronous using resque.}
  gem.homepage      = 'http://github.com/joel/resque-async-method-enhanced'
  gem.licenses      = [ 'MIT' ]
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.name          = 'resque-async-method-enhanced'
  gem.require_paths = ['lib']
  gem.version       = ResqueAsyncMethodEnhanced::VERSION

  gem.add_runtime_dependency      'resque'
  gem.add_runtime_dependency      'resque-lock-timeout'
  gem.add_runtime_dependency      'activesupport'
  gem.add_development_dependency  'rspec'
  gem.add_development_dependency  'rake'
end