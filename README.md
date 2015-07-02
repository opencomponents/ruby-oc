# opencomponents
[![Build Status](https://travis-ci.org/opentable/ruby-oc.svg?branch=master)](https://travis-ci.org/opentable/ruby-oc)
[![Coverage Status](https://coveralls.io/repos/opentable/ruby-oc/badge.svg)](https://coveralls.io/r/opentable/ruby-oc)

[OpenComponents][1] for Ruby

[1]:https://github.com/opentable/oc

## Important
This gem is still under heavy development and the API is likely to change at any
time.

## Getting Started
Add the gem to your Gemfile and run `bundle install` (prerelease versions aren't
on RubyGems):
```ruby
gem 'opencomponents', github: 'opentable/ruby-oc'
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
  * [opencomponents-rails][2]
  * [sinatra-opencomponents][3]

[2]:https://github.com/opentable/opencomponents-rails
[3]:https://github.com/opentable/sinatra-opencomponents

## Contributing
Would be rad. Open a PR or Issue if you have an idea for improvements.

## License
Copyright 2015 OpenTable. See LICENSE for details.
