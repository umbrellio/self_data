class SelfData
  Error = Class.new(StandardError)

  class NoDataFound < Error
    attr_reader :file

    def initialize(file = nil)
      @file = file
      super("No data found in #{file}")
    end
  end

  class ConverterNotFound < Error
    attr_reader :format

    def initialize(format = nil)
      @format = format
      super("Not found converter for #{format}")
    end
  end

  class ConversionError < Error
    attr_reader :real_error, :format

    def initialize(format = nil, real_error = nil)
      @format = format
      @real_error = real_error
      super("#{format}: #{real_error.inspect}")
    end
  end
end
