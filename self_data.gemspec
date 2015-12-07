# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'self_data/version'

Gem::Specification.new do |spec|
  spec.name          = "self_data"
  spec.version       = SelfData::VERSION
  spec.authors       = ["TDrive"]
  spec.email         = ["tdrive@xc0de.ru"]

  spec.summary       = ""
  spec.description   = ""
  spec.homepage      = ""

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://github.com/7dr1v3/self_data"
  else
    fail "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport", ">= 3.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "rubocop", "~> 0.35"
  spec.add_development_dependency "pry"
end
