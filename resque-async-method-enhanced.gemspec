# -*- encoding: utf-8 -*-
require File.expand_path('../lib/resque-async-method-enhanced/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Joel AZEMAR', 'Nick Ragaz']
  gem.email         = ['joel.azemar@gmail.com', 'nick.ragaz@gmail.com']
  gem.summary       = %q{Make Active Support instance methods asynchronous using resque.}
  
  gem.description = <<-EOF
    Moves method asynchronously in a simple and not degraded manner. Resque plugin resque-lock-timeout 
    allows one to avoid more work concurentiel. Simple to set up and implement this plug in is pretty amazing.
  EOF
  
  gem.homepage      = 'http://github.com/joel/resque-async-method-enhanced'
  gem.licenses      = [ 'MIT' ]
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.name          = 'resque-async-method-enhanced'
  gem.require_paths = ['lib']
  gem.version       = ResqueAsyncMethodEnhanced::VERSION

  # Hopefully by now:
  gem.required_ruby_version = '>= 1.9.2'
  
  gem.add_runtime_dependency      'resque'
  gem.add_runtime_dependency      'resque-lock-timeout'
  gem.add_runtime_dependency      'resque-retry'
  gem.add_runtime_dependency      'activesupport'
  
  gem.add_development_dependency  'rspec'
  gem.add_development_dependency  'rake'
  
  gem.post_install_message = <<-EOF
    Moves method asynchronously in a simple and not degraded manner. Resque plugin resque-lock-timeout 
    allows one to avoid more work concurentiel. Simple to set up and implement this plug in is pretty amazing.
    
    add this line to your Gemfile :
    gem 'resque'
    gem 'resque-lock-timeout'
    gem 'resque-async-method-enhanced'
    
    Thanks for installing! All your feedback is valuable to us.
  EOF
end