# frozen_string_literal: true

require "erb"
require "yaml"
require "json"

SelfData.default_formats = [:erb, :yaml]
SelfData.default_options = {}

SelfData.add_converter :erb, -> (data, options) { ERB.new(data).result(options[:context]) }
SelfData.add_converter :json, -> (data, _options) { JSON.parse(data) }

SelfData.add_converter :yaml do |data, _options|
  YAML.respond_to?(:unsafe_load) ? YAML.unsafe_load(data) : YAML.load(data)
end
