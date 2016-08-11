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
Date.today #=> <Date: 2016-08-11 ((2457612j,0s,0n),+0s,2299161j)>
BoundaryDays.all.build
#=>[
#    <Date: 2016-08-12 ((2457613j,0s,0n),+0s,2299161j)>,
#    <Date: 2016-08-15 ((2457616j,0s,0n),+0s,2299161j)>, 
#    <Date: 2016-08-19 ((2457620j,0s,0n),+0s,2299161j)>,
#    <Date: 2016-08-22 ((2457623j,0s,0n),+0s,2299161j)>,
#    <Date: 2016-08-26 ((2457627j,0s,0n),+0s,2299161j)>,
#
# ...
#
#    <Date: 2017-08-04 ((2457970j,0s,0n),+0s,2299161j)>,
#    <Date: 2017-08-07 ((2457973j,0s,0n),+0s,2299161j)>,
#    <Date: 2017-08-11 ((2457977j,0s,0n),+0s,2299161j)>
#  ]

BoundaryDays.month.build
# => [
#   <Date: 2016-08-31 ((2457632j,0s,0n),+0s,2299161j)>,
#   <Date: 2016-09-01 ((2457633j,0s,0n),+0s,2299161j)>,
#   <Date: 2016-09-30 ((2457662j,0s,0n),+0s,2299161j)>,
#   <Date: 2016-10-01 ((2457663j,0s,0n),+0s,2299161j)>, 
#
# ...
#
#   <Date: 2017-07-01 ((2457936j,0s,0n),+0s,2299161j)>,
#   <Date: 2017-07-31 ((2457966j,0s,0n),+0s,2299161j)>,
#   <Date: 2017-08-01 ((2457967j,0s,0n),+0s,2299161j)>]
#  ]

BoundaryDays.week.build
# => [
#   <Date: 2016-08-12 ((2457613j,0s,0n),+0s,2299161j)>,
#   <Date: 2016-08-15 ((2457616j,0s,0n),+0s,2299161j)>,
#   <Date: 2016-08-19 ((2457620j,0s,0n),+0s,2299161j)>, 
#   <Date: 2016-08-22 ((2457623j,0s,0n),+0s,2299161j)>,
#   <Date: 2016-08-26 ((2457627j,0s,0n),+0s,2299161j)>, 
#
# ...
#
#   <Date: 2017-08-07 ((2457973j,0s,0n),+0s,2299161j)>,
#   <Date: 2017-08-11 ((2457977j,0s,0n),+0s,2299161j)>
#  ]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/boundary_days. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
