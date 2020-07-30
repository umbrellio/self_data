# frozen_string_literal: true

require "yaml"
require "json"

class SelfData
  class << self
    attr_accessor :default_formats, :default_options

    def read(*args, **kargs)
      new.read(*args, **kargs)
    end

    def load(*args, **kargs)
      new.load(*args, **kargs)
    end

    def filters
      @filters ||= []
    end

    def add_filter(&block)
      filters << block
    end

    def converters
      @converters ||= {}
    end

    def add_converter(name, block)
      converters[name] = block
    end
  end

  attr_reader :file

  def initialize(file = caller_file)
    @file = file
  end

  def load(*formats, **options)
    formats = self.class.default_formats if formats.empty?
    options = self.class.default_options if options.empty?

    formats.reduce(read) do |data, format|
      raise ConverterNotFound, format unless self.class.converters[format]
      begin
        self.class.converters[format].call(data, options)
      rescue => e
        raise ConversionError.new(format, e)
      end
    end
  end

  def read
    IO.read(file).scan(/\n__END__\n(.*)/m).flatten.first or raise NoDataFound, file
  end

  private

  def caller_file
    calls = caller.lazy
      .map { |call_string| call_string.split(":").first }
      .reject { |file| file == __FILE__ }
      .select(&File.method(:exist?))

    self.class.filters.each do |filter|
      calls = calls.select(&filter.method(:call))
    end

    calls.first
  end
end

require "self_data/errors"
require "self_data/version"
require "self_data/config"
