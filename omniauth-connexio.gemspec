# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-connexio/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-connexio'
  spec.version       = OmniAuth::Connexio::VERSION
  spec.authors       = ['John Allen']
  spec.email         = ['john@threedogconsulting.com']
  spec.summary       = %q{OmniAuth strategy for Connexio}
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/connexio-labs/omniauth-connexio'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_development_dependency 'coveralls', '~> 0.7'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 10.0'
end
