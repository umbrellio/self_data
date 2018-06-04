# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "self_data/version"

files_regexp = %r{^(test|spec|features)/}

Gem::Specification.new do |spec|
  spec.name          = "self_data"
  spec.version       = SelfData::VERSION
  spec.authors       = ["Umbrellio"]
  spec.email         = ["info@umbrellio.biz"]

  spec.summary       = ""
  spec.description   = "It's like DATA but better"
  spec.homepage      = "https://github.com/umbrellio/self_data"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(files_regexp) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport", ">= 3.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop-config-umbrellio"
end
