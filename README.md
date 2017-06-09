# SelfData

It's like native ruby DATA but you can use it not only for main file.

For example:
```
# main.rb

require 'self_data'
require './a.rb'

puts "DATA: #{A.native_data}"
puts "SelfData: #{A.self_data}"

__END__
main.rb data
```

```
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
```
$ ruby main.rb
DATA: main.rb data
SelfData: a.rb data
```

# Usage
Use SelfData.read to get text or use SelfData.load to get formatted data (like yaml, xml, erb, etc).

Look at the [lib/self_data/config.rb](./self_data/blob/master/lib/self_data/config.rb) for more details.
