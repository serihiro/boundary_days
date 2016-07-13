# BoundaryDays

Generate Date object list of sensitive dates.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'boundary_days'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install boundary_days

## Usage

```ruby
require 'boundary_days'
BoundaryDays.all.build
#=>[
#   #<Date: 2016-07-18 ((2457588j,0s,0n),+0s,2299161j)>,
#   #<Date: 2016-07-25 ((2457595j,0s,0n),+0s,2299161j)>,
#   #<Date: 2016-07-31 ((2457601j,0s,0n),+0s,2299161j)>,
#   #<Date: 2016-08-01 ((2457602j,0s,0n),+0s,2299161j)>,
#   #<Date: 2016-08-08 ((2457609j,0s,0n),+0s,2299161j)>,
#   #<Date: 2016-08-15 ((2457616j,0s,0n),+0s,2299161j)>,
#
# ...
#
#   #<Date: 2017-08-01 ((2457967j,0s,0n),+0s,2299161j)>,
#   #<Date: 2017-08-31 ((2457997j,0s,0n),+0s,2299161j)>,
#   #<Date: 2017-09-01 ((2457998j,0s,0n),+0s,2299161j)>,
#   #<Date: 2017-09-30 ((2458027j,0s,0n),+0s,2299161j)>
#  ]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/boundary_days. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
