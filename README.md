# CachingEnumerator [![Build Status](https://travis-ci.org/cyclotron3k/caching_enumerator.svg?branch=master)](https://travis-ci.org/cyclotron3k/caching_enumerator)

A caching wrapper for Enumerator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'caching_enumerator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install caching_enumerator

## Usage

```ruby
require 'caching_enumerator'

enum = CachingEnumerator.new do |yielder|
  5.times do |i|
    puts "very expensive operation #{i}"
    yielder.yield i
  end
end

enum.take 2
# very expensive operation 0
# very expensive operation 1
# => [0, 1]

enum.take 3
# very expensive operation 2
# => [0, 1, 2]

enum.next
# => 0

enum.next
# => 1

enum.next
# => 2

enum.next
# very expensive operation 3
# => 3

enum.rewind.next
# => 0

# calling `reset` will clear the cache and rewind the internal pointers
enum.reset.next
# very expensive operation 0
# => 0

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cyclotron3k/caching_enumerator.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
