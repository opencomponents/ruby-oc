# opencomponents
[![Build Status](https://travis-ci.org/opentable/ruby-oc.svg?branch=master)][1]
[![Coverage Status](https://coveralls.io/repos/opentable/ruby-oc/badge.svg)][2]
[![Code Climate](https://codeclimate.com/github/opentable/ruby-oc/badges/gpa.svg)][3]
[![Gem Version](https://badge.fury.io/rb/opencomponents.svg)][4]
[![Dependency Status](https://gemnasium.com/opentable/ruby-oc.svg)][5]

[1]:https://travis-ci.org/opentable/ruby-oc
[2]:https://coveralls.io/r/opentable/ruby-oc
[3]:https://codeclimate.com/github/opentable/ruby-oc
[4]:http://badge.fury.io/rb/opencomponents
[5]:https://gemnasium.com/opentable/ruby-oc

[OpenComponents][6] for Ruby

[6]:https://github.com/opentable/oc

## Important
This gem is still under heavy development and the API is likely to change at any
time.

## Getting Started
Add the gem to your Gemfile and run `bundle install`:
```ruby
gem 'opencomponents', '~> 0.1.0'
```

By default, the gem will attempt to use a component registry located at
`http://localhost:3030`.
If you want to use a different registry, you can configure OpenComponents to use
it with:
```ruby
OpenComponents.configure { |config| config.registry = 'http://some.other.host' }
```

## Integrations
Individual integrations for rendering components in Rails and Sinatra are
available.
  * [opencomponents-rails][7]
  * [sinatra-opencomponents][8]

[7]:https://github.com/opentable/opencomponents-rails
[8]:https://github.com/opentable/sinatra-opencomponents

## Contributing
Would be rad. Open a PR or Issue if you have an idea for improvements.

## License
Copyright 2015 OpenTable. See LICENSE for details.
