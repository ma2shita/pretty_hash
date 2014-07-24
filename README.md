# PrettyHash

PrettyPrint the Hash

Format to the ascii table format for Hash.
It's very small library.

## Installation

Add this line to your application's Gemfile:

    gem 'pretty_hash'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pretty_hash

## Quick Start

```
require 'pretty_hash'
puts {"a" => "abcde", "bbb" =>  "a"}.to_pp_table
```

```
---|-----
  a|abcde
bbb|a
---|-----
```

## Features

### Symbol key

`{:ccc => "aa", "dddd" =>  "a"}.to_pp_table`

```
----|--
:ccc|aa
dddd|a
----|--
```

### Proc is applied to the value

```
v1 = Struct.new(:name).new("foo")
v1.name
=> "foo"
v2 = Struct.new(:name).new("bar")
v2.name
=> "bar"
```


`{:k1 => v1, :k2 => v2}.to_pp_table`

```
---|---------------------
:k1|#<struct name="hoge">
:k2|#<struct name="foo">
---|---------------------
```

Too bad....

`{:k1 => v1, :k2 => v2}.to_pp_table(Proc.new{|c|c.name})`

```
---|----
:k1|hoge
:k2|foo
---|----
```

Good!

### Multibyte

`{:ccc => "日本語講座", "dddd" =>  "a"}.to_pp_table`

```
----|----------
:ccc|日本語講座
dddd|a
----|----------
```

Just fit width.

## Not implement

* Nested value (e.g.) `{ a: => {:v1 => 1 }}`  
  Use to Proc.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pretty_hash/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
