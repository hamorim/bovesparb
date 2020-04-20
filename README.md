# Bovesparb [![Gem Version](https://badge.fury.io/rb/bovesparb.svg)](https://badge.fury.io/rb/bovesparb)

A Ruby library to query the Bovespa quotes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bovesparb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bovesparb

## Usage

```ruby
require 'bovesparb'

client = Bovesparb::Client.new
client.quotes('BIDI4')

{
  :ticket=>"BIDI4",
  :name=>"BANCO INTER PN      N2",
  :Ibovespa=>"",
  :date=>"20/04/2020 12:59:40",
  :open=>"9,10",
  :low=>"8,84",
  :high=>"9,29",
  :average=>"9,11",
  :close=>"9,24",
  :variation=>"0,22"
}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hamorim/bovesparb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bovesparb project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hamorim/bovesparb/blob/master/CODE_OF_CONDUCT.md).
