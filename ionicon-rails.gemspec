# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ionicon-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["rickybrown"]
  gem.email         = ["ricky@brilliantlabs.co"]
  gem.description   = ""
  gem.summary       = "an asset gemification of the ionicon icon font library"
  gem.homepage      = "https://github.com/rickybrown/ionicon-rails"
  gem.licenses      = ["MIT", "SIL Open Font License"]

  gem.files         = `git ls-files -- {app,bin,lib,test,spec}/* {LICENSE*,Rakefile,README*}`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec}/*`.split("\n")
  gem.name          = "ionicon-rails"
  gem.require_paths = ["lib"]
  gem.version       = Ionicon::Rails::VERSION

  gem.add_dependency "railties", ">= 3.2", "< 5.2"

  gem.add_development_dependency "activesupport"
  gem.add_development_dependency "sass-rails"

  gem.required_ruby_version = '>= 1.9.3'
end
