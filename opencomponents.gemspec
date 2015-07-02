# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'opencomponents/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency 'rest-client',  '~> 1.8'
  spec.add_development_dependency 'bundler', '~> 1.10'

  spec.authors       = ['Todd Bealmear']
  spec.description   = %q{Consume OpenComponents in Ruby}
  spec.email         = ['tbealmear@opentable.com']
  spec.files         = %w(LICENSE README.md opencomponents.gemspec)
  spec.files        += Dir.glob('lib/**/*.rb')
  spec.homepage      = 'https://github.com/opentable/ruby-oc'
  spec.licenses      = ['MIT']
  spec.name          = 'opencomponents'
  spec.require_paths = ['lib']
  spec.summary       = spec.description
  spec.version       = OpenComponents::VERSION
end
