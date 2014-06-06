# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_admin_markitup/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_admin_markitup"
  spec.version       = RailsAdminMarkitup::VERSION
  spec.authors       = ["Robert Whitney"]
  spec.email         = ["robertj.whitney@gmail.com"]
  spec.description   = %q{'Extends rails_admin fields via markit-rails for markup/markdown support'}
  spec.summary       = %q{'Extends rails_admin fields via markit-rails for markup/markdown support'}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "markitup-rails"
  spec.add_dependency "redcarpet", "~> 3.1.2"
end
