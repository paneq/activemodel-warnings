# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "activemodel-warnings/version"

Gem::Specification.new do |s|
  s.name        = "activemodel-warnings"
  s.version     = ActiveModel::Warnings::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Robert Pankowecki (Gavdi Polska)"]
  s.email       = ["robert.pankowecki@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Mark some validations as warnings and let them be easily skipped}
  s.description = %q{Mark some validations as warnings and let them be easily skipped}

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "activemodel-warnings"
  s.add_dependency "activemodel", "~> 4"
  s.add_development_dependency "rake"
  s.add_development_dependency "mocha"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
