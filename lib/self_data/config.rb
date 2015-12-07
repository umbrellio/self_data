SelfData.default_formats = [:erb, :yaml]
SelfData.default_options = {}
SelfData.filters = []

SelfData.add_converter :erb, ->(data, options) { ERB.new(data).result(options[:context]) }
SelfData.add_converter :yaml, ->(data, _options) { YAML.load(data) }
