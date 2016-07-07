# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_menu_manager/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails-menu-manager'
  spec.version       = RailsMenuManager::VERSION
  spec.authors       = ['Florian Schwab']
  spec.email         = ['me@ydkn.de']

  spec.summary       = %q{Simple menu manager for Rails.}
  spec.description   = %q{Simple menu manager for Rails.}
  spec.homepage      = 'https://github.com/ydkn/rails-menu-manager'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'railties', '>= 4.0', '< 6.0'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.2'
  spec.add_development_dependency 'yard',    '~> 0.8'
end
