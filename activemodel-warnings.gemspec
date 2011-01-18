# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "activemodel-warnings/version"

Gem::Specification.new do |s|
  s.name        = "activemodel-warnings"
  s.version     = ActiveModel::Warnings::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Robert Pankowecki (Gavdi Pollska)"]
  s.email       = ["robert.pankowecki@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Mark some validations as warnings and let them be easily skipped}
  s.description = %q{Mark some validations as warnings and let them be easily skipped}

  s.required_rubygems_version = ">= 1.3.6"

  s.rubyforge_project         = "global_boolean"

  s.add_dependency "activemodel", "~> 3.0.3"
  
  s.add_development_dependency "bundler", "= 1.0.7" # Strict because we are overwriting some of its methods
  s.add_development_dependency "gavdi-acolyte", "= 0.1.2"
  s.add_development_dependency "mocha"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
