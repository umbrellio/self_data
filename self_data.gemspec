# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "self_data/version"

files_regexp = %r{^(test|spec|features)/}

Gem::Specification.new do |spec|
  spec.required_ruby_version = ">= 2.6.0"

  spec.name          = "self_data"
  spec.version       = SelfData::VERSION
  spec.authors       = ["Umbrellio"]
  spec.email         = ["info@umbrellio.biz"]

  spec.summary       = "It's like DATA but better"
  spec.description   = "It's like DATA but better"
  spec.homepage      = "https://github.com/umbrellio/self_data"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(files_regexp) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop-config-umbrellio"
  spec.add_development_dependency "simplecov"
end
