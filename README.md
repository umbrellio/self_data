# SelfData &middot; [![Gem Version](https://badge.fury.io/rb/self_data.svg)](https://badge.fury.io/rb/self_data) [![Build Status](https://travis-ci.org/umbrellio/self_data.svg?branch=master)](https://travis-ci.org/umbrellio/self_data) [![Coverage Status](https://coveralls.io/repos/github/umbrellio/self_data/badge.svg)](https://coveralls.io/github/umbrellio/self_data)

It's like native ruby `DATA` but you can use it not only for main file.

## Installation

```ruby
# Gemfile
gem 'self_data'
```

```shell
$ bundle install
-- or --
$ gem install self_data
```

```ruby
require 'self_data'
```

## Synopsis

```ruby
# main.rb

require 'self_data'
require './a.rb'

puts "DATA: #{A.native_data}"
puts "SelfData: #{A.self_data}"

__END__
main.rb data
```

```ruby
# a.rb

module A
  module_function

  def native_data
    DATA.read
  end

  def self_data
    SelfData.read
  end
end

__END__
a.rb data
```

and if you execute it, you'll get:

```shell
$ ruby main.rb
DATA: main.rb data
SelfData: a.rb data
```

## Usage and Notes

Use `SelfData.read()` to get text or use `SelfData.load(*formats, **options)` to get formatted data (like yaml, xml, erb, etc).

Look at the [lib/self_data/config.rb](https://github.com/umbrellio/self_data/blob/master/lib/self_data/config.rb) for more details.

SelfData uses `caller`, it's not fast, that's why you shouldn't use SelfData in loops.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/umbrellio/self_data.

## License

Released under MIT License.

## Authors

Created by [7dr1v3](https://github.com/7dr1v3)

<a href="https://github.com/umbrellio/">
<img style="float: left;" src="https://umbrellio.github.io/Umbrellio/supported_by_umbrellio.svg" alt="Supported by Umbrellio" width="439" height="72">
</a>
