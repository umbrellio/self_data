require "yaml"
require "active_support/core_ext/module/delegation.rb"
require "active_support/core_ext/class/attribute.rb"

class SelfData
  class_attribute :default_formats, :default_options, :filters, :converters

  class << self
    delegate :read, :load, to: :new

    def add_filter(&block)
      filters << block
    end

    def add_converter(name, block)
      self.converters ||= {}
      self.converters[name] = block
    end
  end

  attr_reader :file

  def initialize(file = caller_file)
    @file = file
  end

  def load(*formats, **options)
    formats = default_formats if formats.empty?
    options = default_options if options.empty?

    formats.reduce(read) do |data, format|
      fail ConverterNotFound, format unless converters[format]
      begin
        converters[format].call(data, options)
      rescue => e
        raise ConversionError, format, e
      end
    end
  end

  def read
    IO.read(file).scan(/\n__END__\n(.*)/m).flatten.first or fail NoDataFound, file
  end

  private

  def caller_file
    calls = caller.lazy
      .map { |call_string| call_string.split(':').first }
      .select { |file| file != __FILE__ }
      .select(&File.method(:exist?))

    filters.each do |filter|
      calls = calls.select(&filter.method(:call))
    end

    calls.first
  end
end

require "self_data/errors"
require "self_data/version"
require "self_data/config"
