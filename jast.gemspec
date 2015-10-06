# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jast/version'

Gem::Specification.new do |spec|
  spec.name          = "jast"
  spec.version       = Jast::VERSION
  spec.authors       = ["Daniel Schweighoefer"]
  spec.email         = ["daniel.schweighoefer@pospulse.com"]

  spec.summary       = "JSON Api Schema Tools"
  spec.description   = "A Collection of Tools for building JSON-Api comliant Api definitions ready to be tested with JSON-schema"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19.1"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3.0"
end
