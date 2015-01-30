# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gbv/version'

Gem::Specification.new do |spec|
  spec.name          = "gbv"
  spec.version       = Gbv::VERSION
  spec.authors       = ["nodanaonlyzuul"]
  spec.email         = ["beholdthepanda@gmail.com"]
  spec.summary       = %q{A command line interface for Guided By Voices Songs}
  spec.description   = %q{This is a CLI for Guided By Voices Songs. It just scrapes from gbvdb.com}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir['bin/*','lib/**/*']
  spec.executables   = ['gbv']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri", "1.6.6.2"
  spec.add_dependency "httparty", "0.13.3"
end
